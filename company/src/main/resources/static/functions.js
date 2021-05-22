function deleteClient(id) {
  swal({
    title: "¿Está seguro de eliminar este cliente?",
    text: "Una vez eliminado no lo podrá recuperar",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  })
  .then((willDelete) => {
    if (willDelete) {
      $.ajax({
        url: "/client/delete/" + id,
        success: function(response) {
          console.log(response);
        }
      });
      swal("¡Cliente ha sido eliminado!", {
        icon: "success",
      }).then(ok => {
        if (ok) location.href="/client";
      });
    }
  });
}