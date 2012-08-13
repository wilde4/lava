var captions = new Object();
var urls = new Object();

function change_caption(element_id) {
var name=prompt("Image Caption",captions[element_id]);

  if (name!=null){

    captions[element_id] = name;
    name = escape(name);
    
    $.ajax({
            type: "PUT",
            url: "/elements/" + element_id + ".js",
            data: { 'element[value]' : name, "_method" : "put" },
            timeout: 8000, // in milliseconds
            success: function(data) {
    
              eval(data);
            },
            error: function(request, status, err) {
              alert("Sorry, something went wrong.");
            }
      });
    
    
  }
  return false; // stop the link working
}


function change_url(element_id) {
var name=prompt("Image Link e.g. /about-us",urls[element_id]);

  if (name!=null){

    urls[element_id] = name;
    name = escape(name);
    
    $.ajax({
            type: "PUT",
            url: "/elements/" + element_id + ".js",
            data: { 'element[url]' : name, "_method" : "put" },
            timeout: 8000, // in milliseconds
            success: function(data) {
    
              eval(data);
            },
            error: function(request, status, err) {
              alert("Sorry, something went wrong.");
            }
      });
    
    
  }
  return false; // stop the link working
}