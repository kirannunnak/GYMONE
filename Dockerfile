# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7

################################################################################
# Pick a base image to serve as the foundation for the other build stages in
# this file.
#
# For illustrative purposes, the following FROM command
# is using the alpine image (see https://hub.docker.com/_/alpine).
# By specifying the "latest" tag, it will also use whatever happens to be the
# most recent version of that image when you build your Dockerfile.
# If reproducibility is important, consider using a versioned tag
# (e.g., alpine:3.17.2) or SHA (e.g., alpine@sha256:c41ab5c992deb4fe7e5da09f67a8804a46bd0592bfdf0b1847dde0e0889d2bff).
FROM alpine:latest as base

################################################################################
# Create a stage for building/compiling the application.
#
# The following commands will leverage the "base" stage above to generate
# a "hello world" script and make it executable, but for a real application, you
# would issue a RUN command for your application's build process to generate the
# executable. For language-specific examples, take a look at the Dockerfiles in
# the Awesome Compose repository: https://github.com/docker/awesome-compose
FROM base as build
RUN echo -e '#!/bin/sh\n\
echo Hello world from $(whoami)! In order to get your application running in a container, take a look at the comments in the Dockerfile to get started.'\
> /bin/hello.sh
RUN chmod +x /bin/hello.sh

################################################################################
# Create a final stage for running your application.
#
# The following commands copy the output from the "build" stage above and tell
# the container runtime to execute it when the image is run. Ideally this stage
# contains the minimal runtime dependencies for the application as to produce
# the smallest image possible. This often means using a different and smaller
# image than the one used for building the application, but for illustrative
# purposes the "base" image is used here.
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Use the official Microsoft .NET SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["MVC-DEMO-PROJECT-master/GYMONE/GYMONE/GYMONE.csproj", "GYMONE/"]
RUN dotnet restore "C:/Users/Kiran.Nunna/Downloads/MVC-DEMO-PROJECT-master/MVC-DEMO-PROJECT-master/GYMONE/GYMONE/GYMONE.csproj"
COPY . .
WORKDIR "C:/Users/Kiran.Nunna/Downloads/MVC-DEMO-PROJECT-master/MVC-DEMO-PROJECT-master/GYMONE/GYMONE"
RUN dotnet build "GYMONE.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "GYMONE.csproj" -c Release -o /app/publish

# Final image
FROM base AS final
WORKDIR C:/Users/Kiran.Nunna/Downloads/MVC-DEMO-PROJECT-master/MVC-DEMO-PROJECT-master/GYMONE/GYMONE
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GYMONE.dll"]
