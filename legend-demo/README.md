# Legend Demo

This directory serves to provide a streamlined method for standing up the full Legend stack for individual demonstration purposes. The configurations and infrastructure here are not configured for use outside of a local system.

## Prerequisite: GitLab Application

The Legend application stack requires an OpenID Connect (OIDC) provider for user authentication and authorization. For the purposes of this demo,
we will be using GitLab (gitlab.com) as our OIDC provider, which requires the creation and configuration of a GitLab Application.

### Application Creation and Configuration

1. Navigate to [GitLab](https://www.gitlab.com) and login to your GitLab account.
    * If you do not have a GitLab account, you will need to create one.
2. Once logged in, access the [User Settings > Applications](https://gitlab.com/-/profile/applications) interface to begin creating a new Application.
    1. Name - Legend Demo
    2. Redirect URI - `http://localhost:6060/callback` (We'll add more entries later.)
    3. Confidential - Should be checked.
    4. Scopes - "api", "openid", and "profile" should all be checked.
    5. Click "Save application".
3. Once the application is created, you will be forwarded to the Application management page.
    1. You will see the "Application ID" in plaintext. Copy this text and fill it in for the value of `GITLAB_CLIENT_ID` in [.env](./.env).
    2. There will be a button on the page for your Application Secret. Click this button to have it copied to your clipboard, then paste it into the value of `GITLAB_SECRET` in [.env](./.env).
    3. Ensure that your copy of .env is saved.
4. While on the Application management page, click "edit" to finish adding the Application Redirect URIs. Add each of these entries, one per line:
    * `http://localhost:7070/api/auth/callback`
    * `http://localhost:7070/api/pac4j/login/callback`
    * `http://localhost:8080/studio/log.in/callback`
    * `http://localhost:9095/depot-store/callback`
    * `http://localhost:9595/query/log.in/callback`
5. Once again, click "Save Application".

Your application is now created and configured with this demo.

## Prerequisite: Docker

Before continuing, you'll need to have Docker Desktop installed on your development machine. Instructions for doing so are available [here, on docker.com](https://docs.docker.com/desktop/). See the "Download and install" heading on that page for installation instructions dependent on your development OS.

## Launching Legend

With your OIDC Application ready, you should be able to use `docker-compose` to bring the stack up.

1. Open a terminal session.
2. Within the terminal, navigate to this directory (legend-demo).
3. Use the command `docker-compose up --build --force-recreate --detach`
4. After some time, the set of containers will be up.
    1. Run `docker ps` to get a list of running containers.
    2. You should see each of the following:
        * legend-demo-mongodb
        * legend-demo-engine
        * legend-demo-sdlc
        * legend-demo-studio
        * legend-demo-depot-store
        * legend-demo-depot-server
        * legend-demo-query
    3. For each of the containers listed above, in the order listed, run the command `docker logs <container name>`.
    4. Confirm that you are seeing log output for the container.
        * If you find a container that has not provided any log output, run `docker restart <container name>`.
5. Once you have finished confirming the containers are running, you are ready to continue


## Steps To Add and Expand

1. Config injection - gitlab project ID
2. Config injection - gitlab deploy key
3. Config injection - gitlab username