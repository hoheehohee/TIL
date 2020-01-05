퍼블리셔 취어을 위해 제대로 배워보는 html과 css, 그리고 웹표준 강의 (인프런)
===========
박스모델과 배경 스타일
------
### 박스모델 알아보기
```css
  /*
    * -> 전체 선택자
    스타일의초기화
    모든 요소의 margin, padding을 0으로 초기화
  */
  * {
		margin: 0;
		padding: 0;
	} 
	
  /*
	boxmodels
		content width / height
		border
		padding
		margin
	*/

	.box {
		width: 600px;
		/*border: 5px solid black;*/
		/*padding: 20px;*/

    /*
      사방으로 margin을 주었을 때 각 box의 30 + 30px가 아니라 겹쳐서 보여짐. 
      단 겹쳐 졌을 때 마진의 각 box margin이 다를 때 큰 값이 출력 된다.
    */
		margin: 30px;
		background-color: lime;
	}
	.box2 {
		border: 5px solid black;
		padding: 20px; /* content 크기(.box: width 600px)에서 20px이 추가된다, ex) border px도 마찬가지임. */
	}
	.box3 {
    /* 
      css3 <- IE8,7,...(X) 
      내가 정한 width에서 padding나 border을 추가해도 px가 추가되지 않는다.
    */
		box-sizing: border-box; 
	}
```
```html
  <div class="box">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. A dolorum, quia. Quia non ex, praesentium eum iste unde! Odit maiores, quibusdam quas nobis libero impedit temporibus quasi veritatis iste enim.
  </div>
  <div class="box box2">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. A dolorum, quia. Quia non ex, praesentium eum iste unde! Odit maiores, quibusdam quas nobis libero impedit temporibus quasi veritatis iste enim.
  </div>
  <div class="box box2 box3">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. A dolorum, quia. Quia non ex, praesentium eum iste unde! Odit maiores, quibusdam quas nobis libero impedit temporibus quasi veritatis iste enim.
  </div>
```
### 배경스타일 알아보기
```css
  body {
		background: url(img/twt.png) no-repeat fixed 90% 20px;
		/*background-attachment: fixed; -> 고정해 버린다.*/
	}
	.box {
		width: 600px;
		padding: 20px;
		border: 3px solid black;
		background-color: yellow;
		background-image: url(img/twt.png);
		background-repeat: no-repeat; /*repeat: 반복 | no-repeat: 반복안함 | repeat-x: x축으로 반복 | repeat-y: y축으로 반복*/

    /* background-position: left center; == background-position: 0 50%;*/ 
    /* background-position: 0 0; */
		background-position: -20px 50%;
	}
```
```html
  <div class="box">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit quidem, sed doloribus possimus voluptatem assumenda aliquam quam vitae, ipsum, perferendis amet deserunt exercitationem laborum repudiandae quod incidunt non atque, vero praesentium et dolorum. Excepturi laboriosam magnam quasi fugit tenetur error minus. Officiis, voluptatibus aspernatur doloribus blanditiis quos, inventore, et ea expedita consequatur suscipit labore minima repudiandae veniam atque veritatis numquam velit eligendi illo autem quidem, asperiores id culpa mollitia assumenda exercitationem. Corrupti corporis nisi iusto, libero voluptas ipsam rem mollitia consequatur quod, eius deleniti quas harum nihil saepe recusandae laboriosam aut, accusantium alias excepturi cumque magnam! Amet consequuntur delectus, veniam.
  </div>
  <div class="box">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit quidem, sed doloribus possimus voluptatem assumenda aliquam quam vitae, ipsum, perferendis amet deserunt exercitationem laborum repudiandae quod incidunt non atque, vero praesentium et dolorum. Excepturi laboriosam magnam quasi fugit tenetur error minus. Officiis, voluptatibus aspernatur doloribus blanditiis quos, inventore, et ea expedita consequatur suscipit labore minima repudiandae veniam atque veritatis numquam velit eligendi illo autem quidem, asperiores id culpa mollitia assumenda exercitationem. Corrupti corporis nisi iusto, libero voluptas ipsam rem mollitia consequatur quod, eius deleniti quas harum nihil saepe recusandae laboriosam aut, accusantium alias excepturi cumque magnam! Amet consequuntur delectus, veniam.
  </div>
  <div class="box">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit quidem, sed doloribus possimus voluptatem assumenda aliquam quam vitae, ipsum, perferendis amet deserunt exercitationem laborum repudiandae quod incidunt non atque, vero praesentium et dolorum. Excepturi laboriosam magnam quasi fugit tenetur error minus. Officiis, voluptatibus aspernatur doloribus blanditiis quos, inventore, et ea expedita consequatur suscipit labore minima repudiandae veniam atque veritatis numquam velit eligendi illo autem quidem, asperiores id culpa mollitia assumenda exercitationem. Corrupti corporis nisi iusto, libero voluptas ipsam rem mollitia consequatur quod, eius deleniti quas harum nihil saepe recusandae laboriosam aut, accusantium alias excepturi cumque magnam! Amet consequuntur delectus, veniam.
  </div>
```

```css
  .box {
		width: 600px;
		padding: 20px;
		border: 3px solid black;
    /*배경 위치 잡는게 제일 많이 씀.*/
		background: url(img/photo.jpg) no-repeat 50% 50%;
	}
	.box2 {
		/*background-size: 100% auto;*/
		/*background-size: auto 100%;*/
		background-size: cover; /*css3, 이미지를 자동으로 꽉 채우고 넘치는 부분은 짜름*/
		background-clip: content-box; /*css3, content영역에만 배경이 나옴.*/
		background-origin: content-box; /*css3*, content 기준으로 배경이 나옴.(별로 안씀)/
	}
```

```html
  <div class="box">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit quidem, sed doloribus possimus voluptatem assumenda aliquam quam vitae, ipsum, perferendis amet deserunt exercitationem laborum repudiandae quod incidunt non atque, vero praesentium et dolorum. Excepturi laboriosam magnam quasi fugit tenetur error minus. Officiis, voluptatibus aspernatur doloribus blanditiis quos, inventore, et ea expedita consequatur suscipit labore minima repudiandae veniam atque veritatis numquam velit eligendi illo autem quidem, asperiores id culpa mollitia assumenda exercitationem. Corrupti corporis nisi iusto, libero voluptas ipsam rem mollitia consequatur quod, eius deleniti quas harum nihil saepe recusandae laboriosam aut, accusantium alias excepturi cumque magnam! Amet consequuntur delectus, veniam.
  </div>
  <div class="box box2">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit quidem, sed doloribus possimus voluptatem assumenda aliquam quam vitae, ipsum, perferendis amet deserunt exercitationem laborum repudiandae quod incidunt non atque, vero praesentium et dolorum. Excepturi laboriosam magnam quasi fugit tenetur error minus. Officiis, voluptatibus aspernatur doloribus blanditiis quos, inventore, et ea expedita consequatur suscipit labore minima repudiandae veniam atque veritatis numquam velit eligendi illo autem quidem, asperiores id culpa mollitia assumenda exercitationem. Corrupti corporis nisi iusto, libero voluptas ipsam rem mollitia consequatur quod, eius deleniti quas harum nihil saepe recusandae laboriosam aut, accusantium alias excepturi cumque magnam! Amet consequuntur delectus, veniam.
  </div>
```

### 플롯 지정하기

```html
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>float</title>
	<style>
	* {
		margin: 0;
		padding: 0;
	}
	body {
		font: 12px/1.6 'Malgun Gothic',sans-serif;
		/*font : weight style variant size/line-height family*/
		/*font : size family*/
	}
	.wrap {
		width: 800px;
		margin: 0 auto;		
	}
	.wrap h1 {
		padding: 15px 0;
	}
	.wrap .thumb {
		float: left; /*left | right*/
		margin: 15px 0 15px 0;
	}
	.wrap .text {
		margin-left: 115px;
		/*background-color: lime;*/
	}
	.wrap .text p {
		margin-bottom: 15px; 
	}
	</style>
</head>
<body>
	
<div class="wrap">	
	<h1>float example</h1>
	<p class="thumb"><img src="http://placehold.it/100x120?text=Profile" alt=""></p>
	<div class="text">
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit quos voluptate non. Libero eaque optio doloribus distinctio sint totam ratione debitis cupiditate, unde mollitia sit voluptas. Laudantium dolorem omnis veritatis nobis nostrum dolor, illum nisi. Hic odio beatae doloribus, eligendi voluptate, odit eveniet magni architecto suscipit aspernatur nulla dicta possimus eum! Temporibus voluptate natus omnis officia corporis id perferendis quod iste dolores, adipisci quos sed, odit molestiae magnam fugit amet porro iusto perspiciatis cum enim commodi. Debitis laboriosam ad, molestiae iusto aliquam delectus nam, pariatur deserunt vero sapiente officia eveniet enim vel veniam quis? Recusandae, accusantium nam doloremque ex nostrum!</p>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit quos voluptate non. Libero eaque optio doloribus distinctio sint totam ratione debitis cupiditate, unde mollitia sit voluptas. Laudantium dolorem omnis veritatis nobis nostrum dolor, illum nisi. Hic odio beatae doloribus, eligendi voluptate, odit eveniet magni architecto suscipit aspernatur nulla dicta possimus eum! Temporibus voluptate natus omnis officia corporis id perferendis quod iste dolores, adipisci quos sed, odit molestiae magnam fugit amet porro iusto perspiciatis cum enim commodi. Debitis laboriosam ad, molestiae iusto aliquam delectus nam, pariatur deserunt vero sapiente officia eveniet enim vel veniam quis? Recusandae, accusantium nam doloremque ex nostrum!</p>
	</div>
</div>

</body>
</html>

```
```html
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>float</title>
	<style>
	* {
		margin: 0;
		padding: 0;
	}
	body {
		font: 12px/1.6 'Malgun Gothic',sans-serif;
		/*font : weight style variant size/line-height family*/
		/*font : size family*/
	}
	img {
		vertical-align: top; /* 이미지 틈을 제거 해주는 공식 */
	}
	.wrap {
		width: 800px;
		margin: 0 auto;		
	}
	.wrap h1 {
		padding: 15px 0;
	}
	.wrap .thumb {
		float: left; /*left | right*/
		border: 3px solid black;
		margin: 15px 0 15px 0;
	}
	.wrap .text {
    /*
      float의 영향을 받지 않음.
    */
		clear: both; /* left: float left를 제거 | right: right를 제거 | both: 양쪽 다 제거*/
	}
	</style>
</head>
<body>
	
<div class="wrap">	
	<h1>float example</h1>
	<p class="thumb"><img src="http://placehold.it/100x120?text=1" alt=""></p>
	<p class="thumb"><img src="http://placehold.it/100x120?text=2" alt=""></p>
	<p class="thumb"><img src="http://placehold.it/100x120?text=3" alt=""></p>
	<p class="thumb"><img src="http://placehold.it/100x120?text=4" alt=""></p>
	<div class="text">
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta adipisci voluptatibus ad, in eaque error quam facere corporis, laudantium consectetur explicabo magni modi minima quas nostrum ipsam fuga cupiditate ipsa officia aliquid. In aliquid fugiat delectus facere excepturi perspiciatis repudiandae blanditiis voluptatem sit, laborum voluptas fuga animi cum quisquam. Voluptatem iste sequi, expedita, non, sapiente esse ad aperiam voluptates, tempora quibusdam optio voluptatibus ipsam repellendus quod? Velit, rerum. Alias quisquam veritatis unde nostrum, magni, libero corrupti eligendi. Amet numquam officiis, maxime dolorum eveniet, veritatis iusto, earum quisquam minima deserunt dolorem sequi minus quia quod ad. Facilis beatae id ipsam impedit.</p>
	</div>
</div>

</body>
</html>
```

### 플롯 해지하기

```html
  <html lang="ko">
  <head>
    <meta charset="UTF-8">
    <title>clear</title>
    <style>
    img {
      vertical-align: top;
    }
    .area {
      width: 800px;
      margin: 0 auto;
      border: 3px dashed red;
      *zoom: 1; /* 플롯 해지 공식 IE6,IE7 Hack */
    }

    /* 플롯 해지 공식 (IE 8이상) */
    .area:after { /* area의 가장 뒤쪽 (after)*/
      content: '';
      display: block;
      clear: both;
    }
    .area .thumb {
      float: left;
      border: 3px solid black;
    }
    .cls {
      clear: both;
    }
    </style>
  </head>
  <body>
    
  <div class="area">
    <div class="thumb"><img src="http://placehold.it/100x120?text=1" alt=""></div>
    <div class="thumb"><img src="http://placehold.it/100x120?text=2" alt=""></div>
    <div class="thumb"><img src="http://placehold.it/100x120?text=3" alt=""></div>
    <div class="thumb"><img src="http://placehold.it/100x120?text=4" alt=""></div>
    <div class="thumb"><img src="http://placehold.it/100x120?text=5" alt=""></div>
  </div>
  <p class="cls">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, a. Expedita enim quibusdam eos, at voluptates hic. Hic voluptate harum ut illum rerum nobis suscipit excepturi molestias, molestiae illo perferendis impedit, aut sed voluptatibus facilis numquam commodi non assumenda, veritatis ab iste id quaerat ipsum accusantium laboriosam. Recusandae praesentium a, beatae optio dicta quas impedit, tempora perferendis rem nesciunt explicabo commodi at, vitae natus facere nostrum error eum. Consectetur eius aperiam, repudiandae ex vero! A sit, molestias, rerum dolorem veritatis natus tempore, suscipit at in pariatur perferendis nesciunt! Dolorum asperiores dignissimos nisi laboriosam doloribus facere nulla, quae ab et necessitatibus.</p>

  </body>
  </html>
```
```html
  <html lang="ko">
  <head>
    <meta charset="UTF-8">
    <title>clear</title>
    <style>
    img {
      vertical-align: top;
    }
    .area {
      width: 800px;
      /* 다른 플롯해지 공식 */
      overflow: hidden; /* 영역에서 넘치는 부분 */
      margin: 0 auto;
      border: 3px dashed red;
      *zoom: 1; /* IE6,IE7 Hack */
    }
    /*.area:after {
      content: '';
      display: block;
      clear: both;
    }*/
    .area .thumb {
      float: left;
      border: 3px solid black;
    }
    .cls {
      clear: both;
    }
    </style>
  </head>
  <body>
    
  <div class="area">
    <div class="thumb"><img src="http://placehold.it/100x120?text=1" alt=""></div>
    <div class="thumb"><img src="http://placehold.it/100x120?text=2" alt=""></div>
    <div class="thumb"><img src="http://placehold.it/100x120?text=3" alt=""></div>
    <div class="thumb"><img src="http://placehold.it/100x120?text=4" alt=""></div>
    <div class="thumb"><img src="http://placehold.it/100x120?text=5" alt=""></div>
  </div>
  <p class="cls">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, a. Expedita enim quibusdam eos, at voluptates hic. Hic voluptate harum ut illum rerum nobis suscipit excepturi molestias, molestiae illo perferendis impedit, aut sed voluptatibus facilis numquam commodi non assumenda, veritatis ab iste id quaerat ipsum accusantium laboriosam. Recusandae praesentium a, beatae optio dicta quas impedit, tempora perferendis rem nesciunt explicabo commodi at, vitae natus facere nostrum error eum. Consectetur eius aperiam, repudiandae ex vero! A sit, molestias, rerum dolorem veritatis natus tempore, suscipit at in pariatur perferendis nesciunt! Dolorum asperiores dignissimos nisi laboriosam doloribus facere nulla, quae ab et necessitatibus.</p>

  </body>
  </html>
```