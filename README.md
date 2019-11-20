# semantic-release-sample
Sample of how to integrate semantic release into an application.

### Try it out:

##### Commit Linter:
 - Semantic release will analyze your commits. Set a new version, generate release notes. It will need push rights to this repo, so start out by forking this repo.
 - To use this you will need to use [conventional commits](https://www.conventionalcommits.org). A commit linter ensure you are following this standard. The script assumes a feature branch workflow.
```
git checkout -b coolfeature
echo something cool >> somefile.txt
git add somefile.txt
git commit -m "this is not a conventional commit message"
./ci/commit_lint.sh
```
 - This will run into an error. A Jenkins build would've been aborted here
```
git commit --amend -m "feat: added a cool thing"
./ci/commit_lint.sh
```
 - Much better
 
##### Semantic Release:
 - Run this to try out the actual semantic release. Configuration can be altered in the .releaserc file.
```
git checkout -b production master
git merge --no-ff coolfeature
./ci/semantic_release.sh
```
 - The sample app has been automatically released and a git tag been pushed
 - ci/export_version.sh has been called - you can do stuff with your version number there - for example:
```
oc set env dc/my-application APP_VERSION="${APP_VERSION}"
```
 - target/RELEASE_NOTES.md has been generated
 
### Use it:
 - Copy the ci folder and the .releaserc to your project
 - Adjust settings in the .releaserc
 - You can also automate jira releases. A sample config exists: .releaserc_with_jira - it requires auth via a JIRA_AUTH environment variable.
 - On Jekins call ci/commit_lint.sh on your feature branches
 - On Jekins call ci/semantic_release.sh on your production branch
