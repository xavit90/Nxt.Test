namespace Nxt.Test.WebApp.Models;

public partial class Empleado
{
    public int? UserId { get; set; }

    public decimal? Sueldo { get; set; }

    public DateOnly? FechaIngreso { get; set; }

    public virtual Usuario? User { get; set; }
}
