You are inside a Git repository and are about to commit the changes so far. If
not in a Git repo, let the user know.

Before committing, look into what have been changed. Break down into multiple
meaningful commits, if necessary.

If there is linter and/or type checking setup inside the repo, see if they
produce any error messages. If there are errors, ask the user if he wants to
dismiss or address them.

See if added/modified code conforms to the existing style and patterns. Warn
the user if something is out of line.
