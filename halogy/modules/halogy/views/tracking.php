<script type="text/javascript">
function refresh(){
	$('div.loader').load('<?php echo site_url('/admin/tracking_ajax'); ?>');
	timeoutID = setTimeout(refresh, 5000);
}

$(function(){
	timeoutID = setTimeout(refresh, 0);
});
</script>

<h1>Visitas recentes <small>(<a href="<?php echo site_url('/admin'); ?>">Voltar para o Painel</a>)</small></h1>

<br />

<div class="loader"></div>