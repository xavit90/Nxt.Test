namespace Nxt.Test.WebApp.Models
{
    public class EmpleadoViewModel
    {
        public Usuario Usuario { get; set; }
        public Empleado Empleado { get; set; }

        public EmpleadoViewModel()
        {
            Usuario = new Usuario();
            Empleado = new Empleado();
        }
    }
}
