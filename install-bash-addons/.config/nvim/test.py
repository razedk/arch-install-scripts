#
# IS tools main script
#

# System imports
import sys
import argparse

# Util imports
from utils.v1 import module_utils, python_utils, is_utils


# Commands
def setup_command():
    module_version = "v1"
    module_utils.dynamic_module_call("setup", module_version)


def checkout_command():
    module_version = "v1"
    module_utils.dynamic_module_call("checkout", module_version)


def parse_arguments(args):
    # Handle command line args
    print(f"Args values are {args}")
    parser = argparse.ArgumentParser(
        description='The "is" script makes it easier for developers to get started working on a new project as fast as possible')

    # Create a subparser object
    subparsers = parser.add_subparsers(title='commands', dest='command')

    # Subparser for the "setup" command
    parser_setup = subparsers.add_parser(
        'setup', help='Setup of environment variables, developer software, and GitLab setup')
    parser_setup.set_defaults(func=setup_command)

    # Subparser for the "checkout" command
    parser_checkout = subparsers.add_parser(
        'checkout', help='Checkout of project code')
    parser_checkout.set_defaults(func=checkout_command)

    parser.usage = is_utils.is_usage("<command>", parser).format(parser.prog)
    parsed_args = parser.parse_args(args)

    # Verify that we got a valid command, otherwise exit
    if parsed_args.command is None:
        parser.print_help()
        sys.exit(1)

    setup_command()

    hest = 123

    return parsed_args

# Main method - BEGIN


def main():

    # Ensure we have correct python packages installed
    is_path = module_utils.get_module_path(__file__)
    python_utils.install_requirements(is_path)

    parsed_args = parse_arguments(sys.argv[1:2])

    # Call the appropriate function based on the subcommand
    parsed_args.func()


if __name__ == "__main__":
    main()
# Main method - END
