<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="icon" href="<?php echo $this->config->item('staticPath'); ?>/images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<?php echo $this->config->item('staticPath'); ?>/css/admin.css" media="all" />
	<link rel="stylesheet" type="text/css" href="<?php echo $this->config->item('staticPath'); ?>/css/lightbox.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="<?php echo $this->config->item('staticPath'); ?>/css/datepicker.css" media="screen" />
	<script language="javascript" type="text/javascript" src="<?php echo $this->config->item('staticPath'); ?>/js/jquery.js"></script>
	<script language="javascript" type="text/javascript" src="<?php echo $this->config->item('staticPath'); ?>/js/jquery.lightbox.js"></script>
	<script language="javascript" type="text/javascript" src="<?php echo $this->config->item('staticPath'); ?>/js/default.js"></script>
	<script language="javascript" type="text/javascript" src="<?php echo $this->config->item('staticPath'); ?>/js/admin.js"></script>

	<script language="JavaScript">			
		$(function(){
			$('ul#menubar li').hover(
				function() { $('ul', this).css('display', 'block').parent().addClass('hover'); },
				function() { $('ul', this).css('display', 'none').parent().removeClass('hover'); }
			);			
		});		
	</script>		
	
	<title><?php echo (isset($this->site->config['siteName'])) ? $this->site->config['siteName'] : 'Login to'; ?> Admin - Halogy</title>
	
</head>
<body>

<div class="bg">
	
	<div class="container">
	
		<div id="header">

			<div id="logo">
			
				<?php
					// set logo
					if ($this->config->item('logoPath')) $logo = $this->config->item('logoPath');
					elseif ($image = $this->uploads->load_image('admin-logo')) $logo = $image['src'];
					else $logo = $this->config->item('staticPath').'/images/halogy_logo.jpg';
				?>

				<h1><a href="<?php echo site_url('/admin'); ?>"><?php echo (isset($this->site->config['siteName'])) ? $this->site->config['siteName'] : 'Login to'; ?> Admin</a></h1>
				<a href="<?php echo site_url('/admin'); ?>"><img src="<?php echo $logo; ?>" alt="Logo" /></a>

			</div>

			<div id="siteinfo">
				<ul id="toolbar">
					<li><a href="<?php echo site_url('/'); ?>">Visualizar o Site</a></li>
					<?php if ($this->session->userdata('session_admin')): ?>				
						<li><a href="<?php echo site_url('/admin/dashboard'); ?>">Painel</a></li>
						<li><a href="<?php echo site_url('/admin/users/edit/'.$this->session->userdata('userID')); ?>">Minha conta</a></li>
						<?php if ($this->session->userdata('groupID') == $this->site->config['groupID'] || $this->session->userdata('groupID') < 0): ?>
							<li><a href="<?php echo site_url('/admin/site/'); ?>">Meu Site</a></li>
						<?php endif; ?>
						<?php if ($this->session->userdata('groupID') < 0 && @file_exists(APPPATH.'modules/halogy/controllers/halogy.php')): ?>
							<li class="noborder"><a href="<?php echo site_url('/admin/logout'); ?>">Sair</a></li>
							<li class="superuser"><a href="<?php echo site_url('/halogy/sites'); ?>">Sites</a></li>
						<?php else: ?>
							<li class="last"><a href="<?php echo site_url('/admin/logout'); ?>">Sair</a></li>
						<?php endif; ?>						
					<?php else: ?>
						<li class="last"><a href="<?php echo site_url('/admin'); ?>">Login</a></li>
					<?php endif; ?>
				</ul>

				<?php if ($this->session->userdata('session_admin')): ?>	
					<h2 class="clear"><strong><?php echo $this->site->config['siteName']; ?> Admin</strong></h2>
					<h3>Bem-Vindo: <strong><?php echo $this->session->userdata('username'); ?></strong></h3>
				<?php endif; ?>	
			</div>

		</div>
		
		<div id="navigation">
			<ul id="menubar">
			<?php if($this->session->userdata('session_admin')): ?>
				<?php if (in_array('pages', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/pages'); ?>">Páginas</a>
						<ul class="subnav">
							<li><a href="<?php echo site_url('/admin/pages/viewall'); ?>">Todas as páginas</a></li>
							<?php if (in_array('pages_edit', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/pages/add'); ?>">Adicionar página</a></li>
							<?php endif; ?>
						</ul>
					</li>
				<?php endif; ?>
				<?php if (in_array('pages_templates', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/pages/templates'); ?>">Layout</a>
						<ul class="subnav">
							<li><a href="<?php echo site_url('/admin/pages/templates'); ?>">Todos os layouts</a></li>
							<li><a href="<?php echo site_url('/admin/pages/includes'); ?>">Inclusos</a></li>
							<li><a href="<?php echo site_url('/admin/pages/includes/css'); ?>">CSS</a></li>
							<li><a href="<?php echo site_url('/admin/pages/includes/js'); ?>">Javascript</a></li>
						</ul>
					</li>
				<?php endif; ?>	
				<?php if (in_array('images', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/images/viewall'); ?>">Arquivos</a>
						<ul class="subnav">				
							<li><a href="<?php echo site_url('/admin/images/viewall'); ?>">Imagens</a></li>
							<?php if (in_array('images_all', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/images/folders'); ?>">Pasta de images</a></li>
							<?php endif; ?>
							<?php if (in_array('files', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/files/viewall'); ?>">Arquivos</a></li>
								<?php if (in_array('files_all', $this->permission->permissions)): ?>								
									<li><a href="<?php echo site_url('/admin/files/folders'); ?>">Pasta de arquivos</a></li>						
								<?php endif; ?>
							<?php endif; ?>								
						</ul>
					</li>
				<?php endif; ?>
				<?php if (in_array('webforms', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/webforms/tickets'); ?>">Formulários Web</a>
						<ul class="subnav">
							<li><a href="<?php echo site_url('/admin/webforms/tickets'); ?>">Tickets</a></li>
							<?php if (in_array('webforms_edit', $this->permission->permissions)): ?>							
								<li><a href="<?php echo site_url('/admin/webforms/viewall'); ?>">Todos os Formulários Web</a></li>
								<li><a href="<?php echo site_url('/admin/webforms/add_form'); ?>">Adicionar Formulário Web</a></li>
							<?php endif; ?>
						</ul>
					</li>
				<?php endif; ?>
				<?php if (in_array('blog', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/blog/viewall'); ?>">Notícias</a>
						<ul class="subnav">
							<?php if (in_array('blog', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/blog/viewall'); ?>">Todas as notícias</a></li>
							<?php endif; ?>
							<?php if (in_array('blog_edit', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/blog/add_post'); ?>">Nova notícia</a></li>
							<?php endif; ?>
							<?php if (in_array('blog_cats', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/blog/categories'); ?>">Categoria</a></li>
							<?php endif; ?>							
							<li><a href="<?php echo site_url('/admin/blog/comments'); ?>">Comentários</a></li>
						</ul>
					</li>
				<?php endif; ?>
				<?php if (in_array('shop', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/shop/products'); ?>">Loja</a>
						<ul class="subnav">
							<li><a href="<?php echo site_url('/admin/shop/products'); ?>">Todos os produtos</a></li>
							<?php if (in_array('shop_edit', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/shop/add_product'); ?>">Novo produto</a></li>
							<?php endif; ?>
							<?php if (in_array('shop_cats', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/shop/categories'); ?>">Categoria</a></li>
							<?php endif; ?>
							<?php if (in_array('shop_orders', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/shop/orders'); ?>">Visualizar Pedidos</a></li>
							<?php endif; ?>
							<?php if (in_array('shop_shipping', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/shop/bands'); ?>">Frete</a></li>
								<li><a href="<?php echo site_url('/admin/shop/postages'); ?>">Valores do Frete</a></li>
								<li><a href="<?php echo site_url('/admin/shop/modifiers'); ?>">Modificar Frete</a></li>								
							<?php endif; ?>
							<?php if (in_array('shop_discounts', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/shop/discounts'); ?>">Vale desconto</a></li>
							<?php endif; ?>
							<?php if (in_array('shop_reviews', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/shop/reviews'); ?>">Reviews</a></li>
							<?php endif; ?>
							<?php if (in_array('shop_upsells', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/shop/upsells'); ?>">Mais vendidos</a></li>
							<?php endif; ?>			
						</ul>
					</li>
				<?php endif ?>				
				<?php if (in_array('events', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/events/viewall'); ?>">Agenda</a>
						<ul class="subnav">
							<li><a href="<?php echo site_url('/admin/events/viewall'); ?>">Todos os eventos</a></li>
						<?php if (in_array('events_edit', $this->permission->permissions)): ?>
							<li><a href="<?php echo site_url('/admin/events/add_event'); ?>">Adicionar evento</a></li>
						<?php endif; ?>	
						</ul>
					</li>
				<?php endif; ?>	
				<?php if (in_array('forums', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/forums/forums'); ?>">Foruns</a>
						<ul class="subnav">
							<?php if (in_array('forums', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/forums/forums'); ?>">Foruns</a></li>
							<?php endif; ?>
							<?php if (in_array('forums_cats', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/forums/categories'); ?>">Categorias dos Foruns</a></li>
							<?php endif; ?>
						</ul>
					</li>
				<?php endif; ?>
				<?php if (in_array('wiki', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/wiki'); ?>">Wiki</a>
						<ul class="subnav">
							<?php if (in_array('wiki_edit', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/wiki/viewall'); ?>">Todas as páginas Wiki</a></li>
							<?php endif; ?>
							<?php if (in_array('wiki_cats', $this->permission->permissions)): ?>
								<li><a href="<?php echo site_url('/admin/wiki/categories'); ?>">Categorias Wiki</a></li>
							<?php endif; ?>
							<li><a href="<?php echo site_url('/admin/wiki/changes'); ?>">Atualizações recentes</a></li>							
						</ul>
					</li>
				<?php endif; ?>			
				<?php if (in_array('users', $this->permission->permissions)): ?>
					<li><a href="<?php echo site_url('/admin/users/viewall'); ?>">Usuários</a>
					<?php if (in_array('users_groups', $this->permission->permissions)): ?>
						<ul class="subnav">				
							<li><a href="<?php echo site_url('/admin/users/viewall'); ?>">Todos os usuários</a></li>
							<li><a href="<?php echo site_url('/admin/users/groups'); ?>">Grupo de usuário</a></li>
						</ul>
					<?php endif; ?>						
					</li>
				<?php endif; ?>
				<?php else: ?>
					<li><a href="<?php echo site_url('/admin'); ?>">Login</a></li>
				<?php endif; ?>					
			</ul>
			
		</div>
		
		<div id="content" class="content">
	