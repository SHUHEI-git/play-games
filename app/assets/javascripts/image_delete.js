$(function(){
  $('#drop_area').on('click', function(){
    $('#input_file').click();
  });

  $('#input_file').on('change', function(){
    // 画像が複数枚選択された場合
    if (this.files.length > 1){
      alert('アップロードできる画像は1つだけです');
      $('#input_file').val('');
      return;
    }
    handleFiles(this.files);
  });

  // ドラッグしている要素がドロップ領域に入ったとき・領域にある間
  $('#drop_area').on('dragenter dragover', function(event){
    event.stopPropagation();
    event.preventDefault();
    $('#drop_area').css('border', '1px solid #333');
  });

    // ドラッグしている要素がドロップ領域から外れたとき
  $('#drop_area').on('dragleave', function(event){
    event.stopPropagation();
    event.preventDefault();
    $('#drop_area').css('border', '1px dashed #aaa');
  });

  // ドラッグしている要素がドロップされたとき
  $('#drop_area').on('drop', function (event){
    event.preventDefault();

    $('#input_file')[0].files = event.originalEvent.dataTransfer.files;

    if ($('#input_file')[0].files.length > 1){
      alert('アップロードできる画像は1つだけです');
      $('#input_file').val('');
      return;
    }
    handleFiles($('#input_file')[0].files);
  });

  // 選択された画像ファイルの操作
  function handleFiles(files){
    var file = files[0];
    var imageType = 'image.*';

    // ファイルが画像か確認
    if (! file.type.match(imageType)){
      alert('画像を選択してください');
      $('#input_file').var('');
      $('#drop_area').css('border', '1px dashed #aaa');
      return;
    }

    $('#drop_area').hide();
    $('#icon_clear_button').show();

    var img = document.createElement('img');
    var reader = new FileReader();
    reader.onload = function(){
      img.src = reader.result;
      $('#preview_field').append(img);
    }
    reader.readAsDataURL(file);
  }

  // アイコン画像を消去するボタン
  $('#icon_clear_button').on('click', function () {
    $('#preview_field').empty();  // 表示していた画像を消去
    $('#input_file').val('');  // inputの中身を消去
    $('#drop_area').show();  // drop_areaをいちばん前面に表示
    $('#icon_clear_button').hide();  // icon_clear_buttonを非表示
    $('#drop_area').css('border', '1px dashed #aaa');  // 枠を点線に変更
  })

  // drop_area以外でファイルがドロップされた場合、ファイルが開いてしまうのを防ぐ
  $(document).on('dragenter', function (event) {
    event.stopPropagation();
    event.preventDefault();
  });
  $(document).on('dragover', function (event) {
    event.stopPropagation();
    event.preventDefault();
  });
  $(document).on('drop', function (event) {
    event.stopPropagation();
    event.preventDefault();
  });



});