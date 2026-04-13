Make a pull request (or a merge request, depending on the Git hosting service)
for the changes so far.

Examine the current branch, and if it's `main`, `master`, or `develop`, make a
new branch. If we are already in a branch, determine whether we need to make a
sub-branch. If the changes are somewhat isolateable, we probably want to make a
new sub-branch. Otherwise, we may continue with the current branch.

If there is linter and/or type checking procedure, make sure they all pass. If
there is test code available, make sure all test passes locally.

Spot any micro-refactoring opportunities. If you could improve the code quality
within the context of the main changes, make a suggestion for the refactoring.
If the refactoring scope is relatively large, or it goes beyond the scope of
the current changes, prompt the user if he would like to create an issue (with
the `gh` command) about the refactoring so that he can revisit the issue in the
future.

Come up with a sensible PR title and description based on the changes. Try to
use `gh` commmand to actually create a pull request. If that fails, let the
user handle the authentication process.
