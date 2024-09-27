var XUsuario = (function () {
    function Usuario() {
        var self = this;

        self.DescargarCSV = function () {
            var csv = [];
            var filas = $("#tblEmpleados tr");

            filas.each(function () {
                var fila = [];
                $(this).find('th, td').each(function () {
                    fila.push($(this).text());
                });
                csv.push(fila.join(","));
            });

            var blob = new Blob([csv.join("\n")], { type: 'text/csv' });
            var enlace = document.createElement('a');
            enlace.href = URL.createObjectURL(blob);
            enlace.download = 'Empleados.csv';
            enlace.click();
        };
    }

    var init = function () {
        var usuario = new Usuario();
        $("#btnDescargarCsv").click(usuario.DescargarCSV);
    }

    return { init: init }
})();