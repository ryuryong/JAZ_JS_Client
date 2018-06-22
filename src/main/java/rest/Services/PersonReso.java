package rest.Services;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import domain.Person;

@Path("/people")
@Stateless
public class PersonReso {
	@PersistenceContext
	EntityManager em;
	
	@POST
	@Path("/test")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response test(Person person) {
		return Response.ok(person.getName()).build();
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Person> getByPage(@QueryParam("page") int page) {
		return em.createNamedQuery("person.page", Person.class)
			.setFirstResult(page * 3 - 3)
			.setMaxResults(3)
			.getResultList();
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public Response add(Person person) {
		em.persist(person);

		return Response.ok().build();
	}
	
	@PUT
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response update(@PathParam("id") int id, Person person) {
		Person result = em.createNamedQuery("person.id", Person.class)
			.setParameter("idPerson", id)
			.getSingleResult();
		
		result.setName(person.getName());
		result.setSurname(person.getSurname());
		result.setEmail(person.getEmail());
		result.setAge(person.getAge());
		result.setBirthday(person.getBirthday());
		result.setGender(person.getGender());

		em.persist(result);

		return Response.ok().build();
	}
	
	@DELETE
	@Path("/{id}")
	public Response delete(@PathParam("id") int id) {
		Person result = em.createNamedQuery("person.id", Person.class)
			.setParameter("idPerson", id)
			.getSingleResult();
		
		if (result == null) {
			return Response.status(404).build();
		}
		
		em.remove(result);
		
		return Response.ok().build();
	}
}