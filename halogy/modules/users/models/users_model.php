<?php
/**
 * Halogy
 *
 * A user friendly, modular content management system for PHP 5.0
 * Built on CodeIgniter - http://codeigniter.com
 *
 * @package		Halogy
 * @author		Haloweb Ltd
 * @copyright	Copyright (c) 2012, Haloweb Ltd
 * @license		http://halogy.com/license
 * @link		http://halogy.com/
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

class Users_model extends CI_Model {
	
	function __construct()
	{
		parent::__construct();
		
		// get siteID, if available
		if (defined('SITEID'))
		{
			$this->siteID = SITEID;
		}
	}

	function get_users($q = '')
	{
		$this->db->where(array('siteID' => $this->siteID));

		// tidy query
		$q = $this->db->escape_like_str($q);

		$name = @preg_split('/ /', $q);
		if (count($name) > 1)
		{
			$firstName = $name[0];
			$lastName = $name[1];
			
			$this->db->where('(email LIKE "%'.$q.'%" OR firstName LIKE "%'.$firstName.'%" AND lastName LIKE "%'.$lastName.'%")');
		}
		else
		{
			$this->db->where('(email LIKE "%'.$q.'%" OR firstName LIKE "%'.$q.'%" OR lastName LIKE "%'.$q.'%")');
		}
			
		$query = $this->db->get('users', 30);

		if ($query->num_rows() > 0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	function get_user($userID)
	{
		// default wheres
		if ($this->session->userdata('groupID') >= 0)
		{
			$this->db->where('siteID', $this->siteID);
		}
		
		$this->db->where('userID', $userID);

		// grab
		$query = $this->db->get('users', 1);

		if ($query->num_rows())
		{
			return $query->row_array();
		}
		else
		{
			return false;
		}		
	}

	function get_avatar($filename)
	{
		$pathToAvatars = '/static/uploads/avatars/';
		if (is_file('.'.$pathToAvatars.$filename))
		{
			$avatar = $pathToAvatars.$filename;
		}
		else
		{
			$avatar = $pathToAvatars.'noavatar.gif';
		}
		return $avatar;
	}

	function import_csv($file)
	{
		$handle = fopen($file['tmp_name'], "r");
		
		if ($handle)
		{ 
			$allowedExtensions = array("txt", "csv");
			if (!in_array(end(explode(".", $file['name'])), $allowedExtensions))
			{
				$this->form_validation->set_error('Não é um CSV válido.');
				
				return FALSE;
			}

			$array = @explode("\n", fread($handle, filesize($file['tmp_name'])));

			$total_array = count($array);

			if ($total_array > 0)
			{
				$i = 0;
					
				foreach ($array as $row)
				{
					$data = explode(",", $row);
					
					if ($data[0] != '')
					{	
						// lookup user
						$query = $this->db->get_where('users', array('email' => trim($data[0])), 1);
						
						if ($query->num_rows() > 0)
						{
							// edit user
							$row = $query->row_array();
							if ($row['firstName'] == '' && $row['lastName'] == '')
							{
								$this->db->set('firstName', trim($data[1]));
								$this->db->set('lastName', trim($data[2]));
								$this->db->where('userID', $row['userID']);
								$this->db->update('users');

								$i++;
							}	
						}
						else
						{
							// add new user providing email is valid
							if (!$this->form_validation->valid_email($data[0]))
							{
								$this->form_validation->set_error('<p>O formado do e-mail ('.$data[0].') não é válido, assim a importação não foi concluida. Por favor cheque o arquivo CSV e tente novamente.</p>');
								
								return false;
							}
	
							$username = url_title(strtolower($data[0]));
							$username = str_replace('.','',$username);
							$username = str_replace('-','',$username);
							$username = str_replace('_','',$username);
	
							$this->db->set('dateCreated', date("Y-m-d H:i:s"));
							$this->db->set('username', substr($username,0,6).$i.rand(100,999));
							$this->db->set('password', md5(rand(19999,49999)));
							$this->db->set('email', trim($data[0]));
							$this->db->set('firstName', trim($data[1]));
							$this->db->set('lastName', trim($data[2]));
							$this->db->set('siteID', $this->siteID);
	
							$this->db->insert('users');

							$i++;
						}
					}
				}

				return $i;
			}
			else
			{
				$this->form_validation->set_error('Não contem nenhuma linha no arquivo CSV.');

				return FALSE;
			}
		}
		else
		{
			$this->form_validation->set_error('Não foi possível abrir o arquivo, tente novamente.');
			
			return FALSE;
		}
	}
	
	function export()
	{	
		// default where
		$this->db->where('users.siteID', $this->siteID);
		$this->db->where('users.subscription !=', 'P');
		$this->db->where('users.subscription !=', 'N');
		$this->db->where('users.bounced', '0');

		// select
		$this->db->select('email as Email');
		$this->db->select(' CONCAT(firstName, " ", lastName) as Name', FALSE);

		// join
		$this->db->join('permission_groups', 'permission_groups.groupID = users.groupID', 'left');	

		// order
		$this->db->order_by('dateCreated', 'asc');

		$query = $this->db->get('users');

		if ($query->num_rows() > 0)
		{
			return $query;
		}
		else
		{
			return FALSE;
		}
	}
	
}