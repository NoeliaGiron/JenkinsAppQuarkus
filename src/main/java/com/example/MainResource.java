package com.example;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;

@Path("/")
public class MainResource {

    @GET
    public Response redirectToWeb() {
        return Response.seeOther(java.net.URI.create("/hola/web")).build();
    }
} 