# Legend Demo

This directory serves to provide a streamlined method for standing up the full Legend stack for individual demonstration purposes. The configurations and infrastructure here are not configured for use outside of a local system.

## Prerequisite: GitLab Application

The Legend application stack requires an OpenID Connect (OIDC) provider for user authentication and authorization. For the purposes of this demo,
we will be using GitLab (gitlab.com) as our OIDC provider, which requires the creation and configuration of a GitLab Application.

### Application Creation and Configuration

1. Navigate to [GitLab](https://www.gitlab.com) and login to your GitLab account.
    * If you do not have a GitLab account, you will need to create one.
    * In [.env](./.env), fill in your GitLab username as the value of `GITLAB_USERNAME`.
    * Ensure that your copy of .env is saved.
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
3. Use the command `docker-compose --env-file ./.env up --build --force-recreate --detach`
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
5. Once you have finished confirming the containers are running, you are ready to continue.

## Project Creation

For this step, we will be using Legend Studio to create a new Project. This process will automatically create a new GitLab project
owned by your GitLab user.

1. In your web browser, visit http://localhost:8080/studio - This requires OIDC authorization, so you may be asked to log in to GitLab.
2. In the Studio interface, you should see the "Setup Workspace" dialog, which has two dropdown fields. Click the "+" button to the right of the top dropdown to begin creating a new Project.
3. Make sure you are in the "Create New Project" dialogue, not the "Import Project" dialogue.
4. Fill in the following fields:
    * Project Name - "LegendDemoProject"
    * Description - Can be left blank
    * Group ID - "org.finos.legend.demo"
    * Artifact ID - "demo-project"
5. Click create, and wait a few moments for the process to finish. Once it completes, you should be returned to the "Setup Workspace" dialogue, but with your Project selected in the top dropdown.
6. Before we proceed with any of the Legend applications, we need to visit GitLab and acquire the Project ID and Deploy Token for the Project you just created.
    1. Open up https://gitlab.com/<Your GitLab Username>/LegendDemoProject in your web browser.
    2. Look for the numeric "Project ID", toward the top of the Project page. It should be right underneath the "LegendDemoProject" header.
    3. Copy the value of the Project ID, then paste it into the value of `GITLAB_PROJECT_ID` in [.env](./.env).
    4. In your web browser, open https://gitlab.com/<Your GitLab Username>/LegendDemoProject/-/settings/repository and find the "Deploy Tokens" section.
    5. Click the "Expand" button to the right-hand side of "Deploy Tokens"
    6. Fill in the following fields:
        * Name - legend-demo-deploy-token
        * Expiration Date - Leave this blank.
        * Username - Leave this blank.
        * Scopes - Check "read_repository" and "write_package_registry".
    7. Click the "Create deploy token" button, and the page will refresh.
    8. Under the "Deploy Tokens" heading, you will now see a form titled "Your new Deploy Token username", with two fields:
        * The top field is your Deploy Token Username. Copy this and paste it as the value of `GITLAB_DEPLOY_TOKEN_USERNAME` in [.env](./.env).
        * The bottom field is your Deploy Token Password. Copy this and paste it as the value of `GITLAB_DEPLOY_TOKEN_PASSWORD` in [.env](./.env).
    9. Make sure your .env is saved.

## Project Template Corrections

This section addresses some inconsistencies in the project template, which need to be fixed before we can continue any further.

### pom.xml

1. In your web browser, open https://gitlab.com/<Your GitLab Username>/LegendDemoProject and click the "pom.xml" file.
2. Click the "Open in Web IDE" button.
3. Locate the following properties:
    * platform.legend-engine.version - Change this value to match `LEGEND_ENGINE_VERSION` from [.env](./.env).
    * platform.legend-sdlc.version - Change this value to match `LEGEND_SDLC_VERSION` from [.env](./.env).
4. Click the "Create commit..." button on the bottom-left corner.
5. Click the "Commit" button that now appears.
6. You should now be on the "New Merge Request" screen - Click the "Create Merge Request" button on the bottom of the screen.
7. You should now be on the Merge Request screen - Click either "Merge when pipeline succeeds" or "Merge" button, whichever is present.

### ci_settings.xml

### .gitlab-ci.yml

## Docker Rebuild

Before proceeding any further, 

## Steps To Add and Expand

2. Populate project with Classes, Mappings, and Runtimes
3. Use depot-store API to index versions
4. Fix gitlab-ci.yml
