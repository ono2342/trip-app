$(document).on("turbolinks:load", function() {
  $('#btn1').hide();  //削除ボタンを隠しておく
  $('#btn2').hide();
  $('#btn3').hide();

  $('#user_img1').change(function(){  //1枚目の処理
    var fileprop = $(this).prop('files')[0];
    var filereader = new FileReader();
    
    //画像でない場合は処理終了
    if(fileprop.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
 
    filereader.onload = function() {
      $("#img1").attr('src', filereader.result);
      $('#btn1').show();
    }
    filereader.readAsDataURL(fileprop);

    $('#btn1').on('click', function() {  //画像の削除
      if(window.confirm('サーバーから画像を削除します。\nよろしいですか？')) {
        $('#user_img1').val('');
        $("#img1").removeAttr("src");
        $('#btn1').hide();
        }
      return false;
    });
  });

  $('#user_img2').change(function(){  //2枚目の処理
    var fileprop = $(this).prop('files')[0];
    var filereader = new FileReader();
    
    //画像でない場合は処理終了
    if(fileprop.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
 
    filereader.onload = function() {
      $("#img2").attr('src', filereader.result);
      $('#btn2').show();
    }
    filereader.readAsDataURL(fileprop);

    $('#btn2').on('click', function() {  //画像の削除
      if(window.confirm('サーバーから画像を削除します。\nよろしいですか？')) {
        $('#user_img2').val('');
        $("#img2").removeAttr("src");
        $('#btn2').hide();
        }
      return false;
    });
  });

  $('#user_img3').change(function(){  //3枚目の処理
    var fileprop = $(this).prop('files')[0];
    var filereader = new FileReader();
    
    //画像でない場合は処理終了
    if(fileprop.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
 
    filereader.onload = function() {
      $("#img3").attr('src', filereader.result);
      $('#btn3').show();
    }
    filereader.readAsDataURL(fileprop);

    $('#btn3').on('click', function() {  //画像の削除
      if(window.confirm('サーバーから画像を削除します。\nよろしいですか？')) {
        $('#user_img3').val('');
        $("#img3").removeAttr("src");
        $('#btn3').hide();
        }
      return false;
    });
  });
  // $(function() {  //編集ページ
  //   name = $('.current_user_name').val();
  //   console.log(name[0].image);
  //   console.log(name[1]);
  // })
});