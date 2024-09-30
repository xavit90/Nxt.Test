using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.CodeAnalysis.Options;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;
using Nxt.Test.WebApp.Context;
using Nxt.Test.WebApp.Models;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Nxt.Test.WebApp.Controllers
{
    public class UsuariosController : Controller
    {
        private readonly NxtTestContext _context;

        public UsuariosController(NxtTestContext context)
        {
            _context = context;
        }

        // GET: Inicio
        public async Task<IActionResult> Index()
        {
            var data = await _context.Usuarios
                .Join(_context.Empleados, u => u.UserId, e => e.UserId, (u, e) => new
                {
                    u.UserId,
                    u.Login,
                    u.Nombre,
                    u.Paterno,
                    u.Materno,
                    e.Sueldo,
                    e.FechaIngreso
                })
                .ToListAsync();
            return View(data);
        }

        // GET: Top
        public async Task<IActionResult> Top()
        {
            var usuarios = await _context.Usuarios
                .Take(10)
                .ToListAsync();
            return View(usuarios);
        }

        // GET: Download
        public async Task<IActionResult> Descargar()
        {
            var data = await _context.Usuarios
                .Join(_context.Empleados, u => u.UserId, e => e.UserId, (u, e) => new
                {
                    u.Login,
                    u.Nombre,
                    u.Paterno,
                    u.Materno,
                    e.Sueldo,
                    e.FechaIngreso
                })
                .ToListAsync();
            return View(data);
        }

        // GET: Usuarios/Create
        public IActionResult Crear()
        {
            return View();
        }

        // POST: Usuarios/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Crear([Bind("Usuario,Empleado")] EmpleadoViewModel empleadoVM)
        {
            if (ModelState.IsValid)
            {
                _context.Add(empleadoVM.Usuario);
                await _context.SaveChangesAsync();

                var sql = "INSERT INTO [dbo].[Empleados] ([UserId], [Sueldo], [FechaIngreso]) VALUES (@userId, @sueldo, @fechaIngreso); " +
                    "SELECT [UserId], [Sueldo], [FechaIngreso] FROM [dbo].[Empleados]";
                var @params = new SqlParameter[]
                {
                    new("@userId", SqlDbType.Int) { Value = empleadoVM.Usuario.UserId },
                    new("@sueldo", SqlDbType.Decimal) { Value = empleadoVM.Empleado.Sueldo },
                    new("@fechaIngreso", SqlDbType.Date) { Value = empleadoVM.Empleado.FechaIngreso },
                };
                _context.Empleados.FromSqlRaw(sql, @params)
                    .AsEnumerable()
                    .ToList();
                //await _context.SaveChangesAsync();
                
                return RedirectToAction(nameof(Index));
            }
            return View(empleadoVM);
        }

        // GET: Usuarios/Edit/5
        public async Task<IActionResult> Editar(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var vm = new EmpleadoViewModel
            {
                Usuario = await _context.Usuarios.FindAsync(id) ?? new Usuario(),
                Empleado = _context.Empleados.Where(e => e.UserId == id).FirstOrDefault() ?? new Empleado()
            };

            if (vm.Usuario.UserId <= 0)
            {
                return NotFound();
            }
            return View(vm);
        }

        // POST: Usuarios/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Editar(int id, [Bind("Usuario,Empleado")] EmpleadoViewModel empleadoVM)
        {
            if (id != empleadoVM.Empleado.UserId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Empleados
                        .Where(e => e.UserId == id)
                        .ExecuteUpdate(s => s.SetProperty(e => e.Sueldo, empleadoVM.Empleado.Sueldo));
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UsuarioExists(empleadoVM.Usuario.UserId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(empleadoVM);
        }

        private bool UsuarioExists(int id)
        {
            return _context.Usuarios.Any(e => e.UserId == id);
        }
    }
}
