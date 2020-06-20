$(function() {
  // 商品削除ポップアップ機能
  var deleteBtn = $("#delete-comformation-btn");
  var deletePopUp = $(".overlay");
  // ポップアップを開く
  $("#modal-open-btn").click(function(e) {
    deletePopUp.fadeIn(300);
  });
  // ポップアップを閉じる
  $("#modal-close-btn").click(function(e) {
    deletePopUp.fadeOut(300);
  });
  // 削除確定
  deleteBtn.on("click", function(e) {
    var url = $("#item-delete").attr("href");
    $.ajax({
      url: url,
      type: "DELETE"
    })
    .done(function() {
      deletePopUp.fadeOut(300);
    })
    .fail(function() {
      alert("通信に失敗しました");
    });
  });
});