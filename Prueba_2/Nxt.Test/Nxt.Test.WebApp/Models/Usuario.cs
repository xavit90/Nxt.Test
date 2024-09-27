namespace Nxt.Test.WebApp.Models;

public partial class Usuario
{
    public int UserId { get; set; }

    public string Login { get; set; } = null!;

    public string Nombre { get; set; } = null!;

    public string Paterno { get; set; } = null!;

    public string? Materno { get; set; }
}
