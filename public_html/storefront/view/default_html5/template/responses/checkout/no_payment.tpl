<div class="buttons">
  <table>
    <tr>
      <td class="align_left"><?php echo $button_back; ?></td>
      <td class="align_right"><?php echo $button_confirm; ?></td>
    </tr>
  </table>
</div>
<script type="text/javascript"><!--
$('#back').click(function() {
	location = '<?php echo $back; ?>';
});
$('body').append('<div id="blocker" style="display: none; width: 1667px; height: 1200px; z-index: 1001; background: none repeat scroll 0 0 white; opacity: 0; left: 0; position: absolute; top: 0;"></div>');

$('#checkout').click(function() {
	$('#blocker').show();
	$.ajax({
		type: 'GET',
		url: 'index.php?rt=r/checkout/no_payment/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
//--></script>
