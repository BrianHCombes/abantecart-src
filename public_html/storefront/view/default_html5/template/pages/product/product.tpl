<?php if ($error) { ?>
<div class="alert alert-error">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong><?php echo $error; ?></strong>
</div>
<?php } ?>

<section id="product_details">
<div class="container">    
<!-- Product Details-->
<div class="row">
 <!-- Left Image-->
  <div class="span4">
    <ul class="thumbnails mainimage bigimage">
	<?php if (sizeof($images) > 0) {
		foreach ($images as $image) {	?>
		<li class="span4">
		  <?php 
		  		if( $image['origin'] == 'external' ){ 
		  			$image_url = $image['main_html'];
		  		} else {
		  			$image_url = $image['main_url'];
		  		}
		  ?>
	      <a rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4" class="thumbnail cloud-zoom"  href="<?php echo $image[ 'main_url' ]; ?>" title="<?php echo $image[ 'title' ]; ?>">
	      <img src="<?php echo $image_url; ?>" alt="<?php echo $image[ 'title']; ?>" title="<?php echo $image[ 'title']; ?>">
	      </a>
		</li>
	<?php } } ?>
    </ul>
    <?php if($image_main){ ?>
    <span><?php echo $text_zoom; ?></span>
    <?php } ?>

	<?php if (sizeof($images) > 0) { ?>
	<ul class="thumbnails mainimage smallimage">
		<?php foreach ($images as $image) {	?>
		<li class="producthtumb">
		  <?php 
		  		if( $image['origin'] == 'external' ){ 
		  			$image_url = $image['thumb_html'];
		  		} else {
		  			$image_url = $image['thumb_url'];
		  		}
		  ?>
		  <a class="thumbnail" >
		  <img src="<?php echo $image_url; ?>" alt="<?php echo $image[ 'title']; ?>" title="<?php echo $image[ 'title']; ?>">
		  </a>
		</li>
		<?php } ?>
	</ul>
    <?php } ?>
  </div>
  <!-- Right Details-->
  <div class="span5">
    <div class="row">
      <div class="span5">
        <h1 class="productname"><span class="bgnone"><?php echo $heading_title; ?></span></h1>
		<div class="productprice">        
          <div class="productpageprice">
			<?php if ($display_price) { ?>
			<?php if ($special) { ?>
			    <span class="spiral"></span><?php echo $special; ?>
			    <span class="productpageoldprice"><?php echo $price; ?></span>
			<?php } else { ?>
			    <span class="spiral"></span><?php echo $price; ?>
			<?php } ?>
			<?php } ?>
		</div>
		
			<?php if ($average) { ?>
	          <ul class="rate">
	          	<?php 
	          		#Show stars based on avarage rating
	          		for( $i = 1; $i <= 5; $i++)  {
	          		if ( $i <= $average) {
	          			echo '<li class="on"></li>';
	          		} else {
	          			echo '<li class="off"></li>';
	          		}
	          		}
	          	?>
	          </ul>
			<?php } ?>
		</div>

        <div class="quantitybox">
				<?php if ($display_price) { ?>
					<?php echo $form['form_open']; ?>
					<fieldset>
					<?php if ($options) { ?>
						<?php foreach ($options as $option) { ?>
				  		<div class="control-group">
							<label class="control-label"><?php echo $option[ 'name' ]; ?></label>
				  			<div class="controls">
				      		<?php echo $option[ 'html' ]; ?>
				      		</div>
				      	</div>
						<?php } ?>
					<?php } ?>

					<?php echo $this->getHookVar('extended_product_options'); ?>

					<?php if ($display_price) { ?>
					<?php if ($discounts) { ?>
						<div class="control-group">
						
							<label class="control-label" ><?php echo $text_discount; ?></label>  
							<div class="controls">
								<?php echo $text_order_quantity; ?>
								<?php echo $text_price_per_item; ?>
							</div>
							<?php foreach ($discounts as $discount) { ?>
							<div class="controls">
								<?php echo $discount[ 'quantity' ]; ?>
								<?php echo $discount[ 'price' ];	 ?>
							</div>
							<?php } ?>
						</div>
						<?php } ?>
					<?php } ?>

						<div class="control-group mt20">
							<div class="input-prepend input-append">
								<span class="add-on"><?php echo $text_qty;?></span>
								<?php echo $form['minimum']; ?>
							</div>
							<?php if ($minimum > 1) { ?>
							<div class="controls"><?php echo $text_minimum; ?></div>
							<?php } ?>
							<?php if ($maximum > 0) { ?>
							<div class="controls"><?php echo $text_maximum; ?></div>
							<?php } ?>
						</div>
					
						<div>	
						    <?php echo $form['product_id'].$form['redirect']; ?>
						</div>

						<div class="mt20 ">
						    <ul class="productpagecart">
						    	<li><a href="#" onclick="$(this).closest('form').submit();" class="cart"><?php echo $button_add_to_cart; ?></a></li>
						    </ul>
						    <a class="btn btn-large" href="#" onclick="javascript:window.print()"><i class="icon-print"></i> <?php echo $button_print; ?></a>
						    <?php echo $this->getHookVar('buttons'); ?>
						</div>
					</fieldset>										
				</form>
				<?php } ?>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</section>

  <!-- Product Description tab & comments-->
  <section id="productdesc" class="row">
    <div class="container-fluid">
      <div class="productdesc">
        <ul class="nav nav-tabs" id="myTab">
			<li class="active"><a href="#description"><?php echo $tab_description; ?></a></li>
			<?php if ($review_status) { ?>
			<li><a href="#review"><?php echo $tab_review; ?></a></li>
			<?php } ?>
			<?php if ($tags) { ?>
			<li><a href="#producttag"><?php echo $text_tags; ?></a></li>
			<?php } ?>
			<?php if ($related_products) { ?>
			<li><a href="#relatedproducts"><?php echo $tab_related; ?> (<?php echo count($related_products); ?>)</a></li>
			<?php } ?>
			<?php echo $this->getHookVar('product_features_tab'); ?>
        </ul>
        <div class="tab-content">
          
		<div class="tab-pane active" id="description">
		  <?php echo $description; ?>

 		  <ul class="productinfo">
 		  	<?php if($stock){ ?>
 		  	<li><span class="productinfoleft"><?php echo $text_availability; ?></span> <?php echo $stock; ?> </li>
 		  	<?php } ?>
 		  	<?php if($model){ ?>
 		  	<li><span class="productinfoleft"><?php echo $text_model; ?></span> <?php echo $model; ?> </li>
 		  	<?php } ?>
 		  	<?php if ($manufacturer) { ?>
 		  	<li>
 		  			<span class="productinfoleft"><?php echo $text_manufacturer; ?></span> 
 		  	    	<a href="<?php echo $manufacturers; ?>">
 		  	        <?php if ( $manufacturer_icon ) { ?>  
 		  	        <img src="<?php echo $manufacturer_icon; ?>" title="<?php echo $manufacturer; ?>" border="0"/>
 		  	        <?php } else { echo $manufacturer; }  ?> 
 		  	    	</a>
 		  	</li>
 		  	<?php } ?>
 		  </ul>

		</div>
          
		<?php if ($review_status) { ?>
		<div class="tab-pane" id="review">
		  <div id="current_reviews" class="mb20"></div>
		  <div class="heading" id="review_title"><h4><?php echo $text_write; ?></h4></div>
		  <div class="content">
			<fieldset>
		  		<div class="control-group">
		  			<div class="form-inline">
		  				<label class="control-label span2 pull-left"><?php echo $entry_rating; ?> <span class="red">*</span></label>  
		      			<?php echo $rating_element; ?>
		      		</div>
		      	</div>
		  		<div class="control-group mt40">
		  			<div class="form-inline">
		  				<label class="control-label span2" ><?php echo $entry_name; ?> <span class="red">*</span></label>  
		      			<?php echo $review_name; ?>
		      		</div>
		      	</div>
		  		<div class="control-group">
		  			<div class="form-inline">
		  				<label class="control-label span2" ><?php echo $entry_review; ?> <span class="red">*</span></label>  
		      			<?php echo $review_text; ?>
		      		</div>
		      		<div class="controls"><?php echo $text_note; ?></div>   		
		      	</div>
		  		<div class="clear control-group">
		  			<label class="control-label" ><?php echo $entry_captcha; ?> <span class="red">*</span></label>
		  			<div class="form-inline">
		  				<label class="control-label span2"><img src="index.php?rt=common/captcha" id="captcha_img" alt="" /></label>
		  				<?php echo $review_captcha; ?>
		  			</div>
		      	</div>
		      	<div class="control-group span4">
		      		<div class="pull-right">
		      		<?php echo $review_button; ?>
		      		</div>
		      	</div>
			</fieldset>
		  </div>
		</div>
		<?php } ?>
          
		<?php if ($tags) { ?>
		<div class="tab-pane" id="producttag">
		  <ul class="tags">
		  	<?php foreach ($tags as $tag) { ?>
		  	<li><a href="<?php echo $tag[ 'href' ]; ?>"><i class="icon-tag"></i><?php echo $tag[ 'tag' ]; ?></a>
		  	<?php } ?>
		  </ul>            
		</div>
		<?php } ?>

		<?php if ($related_products) { ?>
		<div class="tab-pane" id="relatedproducts">
		<?php foreach ($related_products as $related_product){ ?>

		    	<div class="related_product">
		    		<a href="<?php echo $related_product[ 'href' ]; ?>"><?php echo $related_product['image'][ 'thumb_html' ] ?></a><br/>
		    		<a href="<?php echo $related_product[ 'href' ]; ?>"><?php echo $related_product[ 'name' ]; ?></a><br/>
		    		<span style="color: #999; font-size: 11px;"><?php echo $related_product[ 'model' ]; ?></span><br/>
		    		<div class="price-add">
		    		<?php if ($display_price) { ?>
		    		<?php if (!$related_product[ 'special' ]) { ?>
		    			<span style="color: #900; font-weight: bold;"><?php echo $related_product[ 'price' ]; ?></span>
		    			<?php } else { ?>
		    			<span style="color: #900; font-weight: bold; text-decoration: line-through;"><?php echo $related_product[ 'price' ]; ?></span>
		    			<span style="color: #F00;"><?php echo $related_product[ 'special' ]; ?></span>
		    			<?php } ?>
		    		<?php } ?>
		    		<a class="buy" id="<?php echo $related_product['product_id']?>" href="<?php echo $related_product[ 'add' ]?>" title="<?php echo $button_add_to_cart; ?>"></a>
		    		</div>
		    		<br/>
		    		<?php if ($related_product[ 'rating' ]) { ?>
		    		<img src="<?php echo $this->templateResource('/image/stars_' . $related_product[ 'rating' ] . '.png'); ?>"
		    		     alt="<?php echo $related_product[ 'stars' ]; ?>"/>
		    		<?php } ?>
		    	</div>

		<?php } ?>
		</div>
		<?php } ?>
          
        <?php echo $this->getHookVar('product_features'); ?> 
          
        </div>
      </div>
    </div>
  </section>

<script type="text/javascript"><!--

var orig_imgs = $('ul.bigimage').html();
var orig_thumbs = $('ul.smallimage').html();

jQuery(function($) {
	$('#current_reviews .pagination a').live('click', function() {
		$('#current_reviews').slideUp('slow');
		$('#current_reviews').load(this.href);
		$('#current_reviews').slideDown('slow');
		return false;
	});

	$('#current_reviews').load('index.php?rt=product/review/review&product_id=<?php echo $product_id; ?>');

});

function review() {
	var dismiss = '<button type="button" class="close" data-dismiss="alert">&times;</button>';

	$.ajax({
		type: 'POST',
		url: 'index.php?rt=product/review/write&product_id=<?php echo $product_id; ?>',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#review_button').attr('disabled', 'disabled');
			$('#review_title').after('<div class="wait"><img src="<?php echo $this->templateResource('/image/loading_1.gif'); ?>" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#review_button').attr('disabled', '');
			$('.wait').remove();
		},
		success: function(data) {
			if (data.error) {
				$('#review_title').after('<div class="alert alert-error">' + dismiss + data.error + '</div>');
			}
			if (data.success) {
				$('#review_title').after('<div class="alert alert-success">' + dismiss + data.success + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
			$('img#captcha_img').attr('src',$('img#captcha_img').attr('src')+'&'+Math.random());
		}
	});
}
$('#product_add_to_cart').click(function(){ $('#product').submit();});
$('#review_submit').click(function(){ review();})

/* Process images for product options */
$('input[name^=\'option\'], select[name^=\'option\']').change(function(){
		$.ajax({
		type: 'POST',
		url: 'index.php?rt=r/product/product/get_option_resources&attribute_value_id='+$(this).val(),
		dataType: 'json',

		success: function(data) {
			var html1='';
			var html2='';
			if(data.images){
				for(img in data.images){
					html1 += '<li class="span4">';
					html2 += '<li class="producthtumb">';
				
					var img_url = data.images[img].main_url;
					var tmb_url = data.images[img].thumb_url;
					if(data.images[img].origin=='external'){
						img_url	= data.images[img].main_html;
						tmb_url = data.images[img].thumb_html;
					}					
					html1 += '<a href="'+img_url+'" rel="position: \'inside\' , showTitle: false, adjustX:-4, adjustY:-4" class="thumbnail cloud-zoom"  title="'+data.images[img].title+'"><img src="'+img_url+'" alt="'+data.images[img].title+'" title="'+data.images[img].title+'"></a>';
					html2 += '<a class="thumbnail"><img src="'+tmb_url+'" alt="'+data.images[img].title+'" title="'+data.images[img].title+'"></a>';
					html1 += '</li>';				
					html2 += '</li>';
				}
			} else {
				html1 = orig_imgs;
				html2 = orig_thumbs;
			}
			$('ul.bigimage').html(html1);
			$('ul.smallimage').html(html2);
			$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
			process_thumbnails();
		}
		
	});
});
//--></script>