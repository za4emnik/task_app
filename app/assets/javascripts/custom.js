function filter(v){
    $.ajax({ type: "GET",
        url: "/filter",
        format: "json",
        data: { f: v.value },
        success: function(data){
          console.log(data);
          prepareData(data, v.value)
        }
    })
  }

function prepareData(data, v){
  $('#filter-block').empty();
  if(v == 'statuses'){
    data.forEach(function(item, i, data){
      $('#filter-block').append('<p>'+item.status+'</p>');
    })
  }else if ((v == 'count-tasks') || (v == 'count-tasks-order-name') || (v == 'projects-a')) {
    data.forEach(function(item, i, data){
      $('#filter-block').append('<p>'+item.name+'</p>'+'<p>'+item.cnt+'</p>');
    })
  }else if((v == 'tasks-n') || (v == 'tasks-dup') || (v == 'projects-a') || (v == 'tasks-ten-done')){
      data.forEach(function(item, i, data){
        $('#filter-block').append('<p>'+item.name+'</p>');
      })
  }else if(v == 'tasks-garage'){
      data.forEach(function(item, i, data){
        $('#filter-block').append('<p>'+item.name+'</p>'+'<p>'+item.status+'</p>');
      })
  }
}
