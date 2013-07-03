var bob;

(function()
{
  var saveCmd =
  {
    modes : { wysiwyg:1, source:1 },
    exec : function( editor )
    {
      var element_id = editor.element.$.attributes.id.value;
      var value = editor.element.$.innerHTML;
      var md5_ref = element_id

      $.ajax({
         url: "/save-content/" + md5_ref + "/",
         type: "post",
         data: {"value" : value},
         success: function(){
            // editor.element.$.style.opacity = "1";
            editor.element.removeClass("not-saved");
         },
         error:function(){
            editor.element.$.style.opacity = "1";
            alert("Error Saving");

         }   
       });
      bob = editor;
      // editor.checkDirty(); // true false
    }
  }
  var pluginName = 'ajaxsave';
  CKEDITOR.plugins.add( pluginName,
  {
     init : function( editor )
     {
       
       editor.on( 'key', function() {
         if(editor.checkDirty()){
           editor.element.addClass("not-saved");           
         }else{
           editor.element.removeClass("not-saved");
         }
       });
                       
        var command = editor.addCommand( pluginName, saveCmd );
        command.modes = { wysiwyg : 1 };
        editor.ui.addButton( 'AjaxSave',
         {
            label : "Save",
            command : pluginName,
            icon: "plugins/ajaxsave/icons/save.png"
         });
     }
   });
})();