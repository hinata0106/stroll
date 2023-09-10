  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
                var formData = new FormData();
        formData.append("image_cache", input.files[0]);
        
        $.ajax({
          url: "/posts/check_cache_image",
          type: "POST",
          data: formData,
          dataType: "json",
          processData: false,
          contentType: false,
        }).done(function(data){
           var tag_list = data.data.tag_list
           var image_flag = data.data.image_flag

           if(image_flag == true){
             $('#image_isnot_sky').removeClass('hidden');
             $("#post-tags").tagit("removeAll");
           }else{
             $('#image_isnot_sky').addClass('hidden');
             $("#post-tags").tagit("removeAll");
             $.each(tag_list, function(index, tag){
               $('#post-tags').tagit('createTag', tag);
             })
           }

        }).fail(function(){
           alert('画像の読み込みに失敗しました');
        })
        $('#image_img_prev').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
     }
  }