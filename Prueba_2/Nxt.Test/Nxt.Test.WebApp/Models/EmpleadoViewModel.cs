namespace Nxt.Test.WebApp.Models
{
    public class EmpleadoViewModel
    {
        public Usuario Usuario { get; set; }
        public Empleado Empleado { get; set; }

        public EmpleadoViewModel()
        {
            Usuario = new Usuario();
            Empleado = new Empleado
            {
                Sueldo = 0,
                FechaIngreso = DateOnly.FromDateTime(DateTime.Now)
            };
        }
    }
}
