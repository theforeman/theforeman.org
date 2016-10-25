# Hammer

Hammer provides a command-line-interface (CLI) for performing
tasks in Katello. It provides an alternative to the web interface where
commands can be run from the command line or used in shell scripts.

## Installation

The Hammer package is installed as part of Katello. Alternatively, Hammer
can be installed and run from a remote system as long as it can connect to
Katello via HTTP or HTTPS.

### Remote install

Install the prerequisite repositories [as per our installation guide](/docs/{{ site.version }}/installation/index.html#required-repositories).

Now install the hammer-cli-katello package:

```
yum -y install rubygem-hammer_cli_katello
```

## Setup

In order to use hammer, we have to configure it to point to the Katello server.

Edit `/etc/hammer/cli.modules.d/foreman.yml` and make sure the :host: points to
your server. You can also set your username and password in this file. Suppose
your server is at `localhost:80` and your credentials are admin/changeme, your
foreman.yml file would contain:

```yaml
:foreman:
  :enable_module: true
  :host: 'http://localhost:80/'
  :username: 'admin'
  :password: 'changeme'
```

Login information can also be passed with each command (see the **Usage**
section) in which case you can omit them from this file.

Also, settings can be overriden on per user basis by creating a `~/.hammer`
directory and placing override files in there. Suppose you wanted to override
`foreman.yml`, then you'd create and update `~/.hammer/cli.modules.d/foreman.yml`.

And then finally test out your installation:

```bash
hammer -vh
```

## Usage

To use Hammer, simply run the `hammer` command. If run without any commands
or options, the `hammer` command will show a list of subcommands.

```
$ hammer
Usage:
    hammer [OPTIONS] SUBCOMMAND [ARG] ...

Parameters:
 SUBCOMMAND                    subcommand
 [ARG] ...                     subcommand arguments

Subcommands:
 activation-key                Manipulate activation keys.
 architecture                  Manipulate architectures.
 auth                          Foreman connection login/logout.
 capsule                       Manipulate capsule
...
```

To view the subcommands or options for a particular Hammer command, simply run
that command with the help option (`--help` or `-h`).

```
$ hammer product --help
Usage:
    hammer product [OPTIONS] SUBCOMMAND [ARG] ...

Parameters:
 SUBCOMMAND                    subcommand
 [ARG] ...                     subcommand arguments

Subcommands:
 create                        Create a product
 delete                        Destroy a product
 info                          Show a product
 list                          List products
 remove-sync-plan              Delete assignment sync plan and product.
 set-sync-plan                 Assign sync plan to product.
 update                        Updates a product

Options:
 -h, --help                    print help
```

```
$ hammer product create -h
Usage:
    hammer product create [OPTIONS]

Options:
 --description DESCRIPTION               Product description
 --gpg-key GPG_KEY_NAME                  Name to search by
 --gpg-key-id GPG_KEY_ID                 gpg key numeric identifier
 --label LABEL
 --name NAME                             Product name
 --organization ORGANIZATION_NAME        Organization name to search by
 --organization-id ORGANIZATION_ID       organization ID
 --organization-label ORGANIZATION_LABEL Organization label to search by
 --sync-plan SYNC_PLAN_NAME              Sync plan name to search by
 --sync-plan-id SYNC_PLAN_ID             sync plan numeric identifier
 -h, --help                              print help
```

To run a command, just pass any relavant options.

```
$ hammer product create --name Test --organization "Default Organization"
Product created
```

If you aren't storing your login name and password in your hammer config file,
you'll need to pass those in as well.

```
$ hammer -u admin -p mypass product create --name Test --organization-id 1
```
