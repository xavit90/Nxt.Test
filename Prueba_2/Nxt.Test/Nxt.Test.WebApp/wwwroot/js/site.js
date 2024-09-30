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

var ICrear = (function () {
    function Empleado() {
        var self = this;

        self.Hoy = function () {
            var fecha = new Date();
            var dd = fecha.getDate();
            var mm = fecha.getMonth() + 1;

            return (dd < 10 ? "0" + dd : dd) + "/" + (mm < 10 ? "0" + mm : mm) + "/" + fecha.getFullYear();;
        }
    }

    var init = function () {
        var empleado = new Empleado();
        $('#Empleado_FechaIngreso').val(empleado.Hoy());
        $('#Empleado_Sueldo').val(0);
    }

    return { init: init }
})();