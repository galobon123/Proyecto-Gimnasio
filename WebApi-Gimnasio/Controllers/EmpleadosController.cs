using Biblioteca_Gimnasio.DTOs;
using Biblioteca_Gimnasio.Services.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace WebApi_Gimnasio.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadosController : ControllerBase
    {
        private readonly IEmpleadosService _service;

        public EmpleadosController(IEmpleadosService service)
        {
            _service = service;
        }

        [HttpGet]
        public ActionResult GetEmpleados()
        {
            try
            {
                var empleados = _service.GetEmpleados();

                return Ok(empleados);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor ${ex}");
            }
        }

        [HttpGet("api/filtros")]
        public ActionResult GetEmpleadosFiltros([FromQuery]EmpleadoFiltrosDto filtros)
        {
            try
            {
                var empleados = _service.GetEmpleadosByFilters(filtros);

                return Ok(empleados);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor ${ex}");
            }
        }

        [HttpDelete]
        public ActionResult DeleteEmpleado(int id)
        {
            try
            {
                var result = _service.DeleteEmployee(id);

                if (result.Success)
                    return Ok(result.Message);
                return StatusCode(result.Id, result.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor ${ex}");
            }
        }

        [HttpPost]
        public ActionResult PostEmpleado([FromQuery]CreateEmpleadosDto empleado)
        {
            try
            {
                var result = _service.CreateEmployee(empleado);

                if (result.Success)
                    return Ok(result.Message);
                return StatusCode(result.Id, result.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor ${ex}");
            }
        }

        [HttpPut]
        public ActionResult PutEmpleado([Required][FromQuery]int id, [FromBody]UpdateEmpleadosDto empleado)
        {
            try
            {
                var result = _service.UpdateEmployee(id, empleado);

                if (result.Success)
                    return Ok(result.Message);
                return StatusCode(result.Id, result.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error interno del servidor ${ex}");
            }
        }
    }
}
