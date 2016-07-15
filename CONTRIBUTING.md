# Contributing to newman-docker

## tl;dr

Use [git-flow](http://nvie.com/posts/a-successful-git-branching-model/).

- Create a feature branch off of `develop`

```bash
git checkout develop
git checkout -b feature/my-feature
```

- Make your changes, and run tests to ensure that everything works

```bash
npm test
```

- If all checks out, push your code and create a pull with `develop` as the target

```bash
git push feature/my-feature
```

## Branching and Tagging Policy

This repository uses standard `git-flow` branch management policy/strategy. If you want to learn more on `git-flow`, refer  to [tutorial from Atlassian](https://www.atlassian.com/git/workflows#!workflow-gitflow) and more details at [http://nvie.com/posts/a-successful-git-branching-model/](http://nvie.com/posts/a-successful-git-branching-model/).


## Preferred IDE
The preferred IDE for this project is SublimeText. You can download it from [http://www.sublimetext.com](http://www.sublimetext.com).

The repository has a sublime project file included in `develop/` directory. This project is configured with the best practices recommended for `xt-edge`. Things like using 120 character ruler, addition of end-of-file newline, cleaning up of trailing whitespace has been configured in this project.

There are a number of SublimeText Plugins that you can use to make your life simpler. One of them is the `jsDoc` autocompletion plugin. Download it from [https://github.com/spadgos/sublime-jsdocs](https://github.com/spadgos/sublime-jsdocs).

> *It is expected that changes to the file `/postman-documentator.sublime-project` is not committed back in the repository without proper discussion with all primary contributors of this project.*

### Generic IDE Settings

Most IDE settings for Sublime Text resides within the project configuration file `./develop/xt-edge.sublime-project`. In case you are using any other IDE, (not recommended,) setting the following defaults of the IDE should help.

1. Set to true to ensure the last line of the file ends in a newline character when saving.
2. Use 120the columns to display vertical ruler.
3. The number of spaces a tab is considered equal should be 4.
4. Insert spaces when tab is pressed.
5. Remove trailing white space on save.
6. Always use UTF-8 character encoding for reading and writing files.
7. Set IDE to not change file permissions upon editing.


## Commit Guidelines

The following best practices, coupled with a pinch of common-sense will keep the repository clean and usable in future. The idea is that everything that goes into the repository is not for an individual, but someone else who will be directly or indirectly affected by it.

### Check for errors before committing

Checking for errors should be done for each commit whether it is being pushed to remote or not.

First, you don't want to submit any whitespace errors. Git provides an easy way to check for this — before you commit, run `git diff --check`, which identifies possible whitespace errors and lists them for you. If you run that command before committing, you can tell if you're about to commit whitespace issues that may annoy other developers.

Secondly, you should ensure that your commit does not break builds. Run `npm test` on the repository to execute all sanity and smoke tests. If any test fail, do not change the test to pass your commit. The tests were there with a purpose. Discuss within your team to ensure that the changes that you do to test specs are valid. If you are adding a new feature, accompanying them with new tests are a good practice.

### Atomic commits

Try to make each commit a logically separate changeset. If you can, try to make your changes digestible — don't code for a whole weekend on five different issues and then submit them all as one massive commit on Monday. Even if you don't commit during the weekend, use the staging area on Monday to split your work into at least one commit per issue, with a useful message per commit. If some of the changes modify the same file, try to use `git add --patch` to partially stage files. The project snapshot at the tip of the branch is identical whether you do one commit or five, as long as all the changes are added at some point, so try to make things easier on your fellow developers when they have to review your changes. This approach also makes it easier to pull out or revert one of the changesets if you need to later. There are a number of useful Git tricks for rewriting history and interactively staging files — use these tools to help craft a clean and understandable history.

### Clean commit message

*More detailed explanation include your motivation for the change and contrast its implementation with previous behavior — this is a good guideline to follow.*

Getting in the habit of creating quality commit messages makes using and collaborating with Git a lot easier. As a general rule, your messages should start with a single line that’s no more than about 50 characters and that describes the changeset concisely, followed by a blank line, followed by a more detailed explanation.

It's also a good idea to use the imperative present tense in these messages. In other words, use commands. Instead of "I added tests for" or "Adding tests for," use "Add tests for."

You should see if your commit message answers the following questions:
Answer the following questions:

1. **Why is this change necessary?**
2. **How does it address the issue?**
3. **What side effects does this change have?**

The first question tells reviewers of your pull request what to expect in the commit, allowing them to more easily identify and point out unrelated changes.

The second question describes, at a high level, what was done to affect change. If your change is obvious, you may be able to omit addressing this question.

The third is the most important question to answer, as it can point out problems where you are making too many changes in one commit or branch. One or two bullet points for related changes may be okay, but five or six are likely indicators of a commit that is doing too many things.

A good commit message template

```
Short (50 chars or less) summary of changes with relevant project management issue ID.

More detailed explanatory text, if necessary.  Wrap it to about 72 characters or so.  In some contexts, the first line is treated as the subject of an email and the rest of the text as the body.  The blank line separating the summary from the body is critical (unless you omit the body entirely); tools like rebase can get confused if you run the two together.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded by a single space, with blank lines in between, but conventions vary here
```

Run `git log --no-merges` to see what a nicely formatted project-commit history looks like.

## Documentation guidelines

~~ to be documented further ~~

## The CI Platform

The CI system is built as a bunch of bash scripts to execute a set of tasks. These scripts are meant to execute tasks that can run on every local machine. In general, knowledge about these scripts are not necessary for development.

**The scripts are to be only accessed using `npm run-script script name`.** This ensures that the execution point of the scripts (`pwd`) is always the repository root.

### Ensuring your commits will not fail build

> `npm test`

The script associated with `npm test` will run all tests that ensures that your commit does not break anything in the repository. As such run `npm test` before you push.

---
*Sections of this document uses excerpts from various books and the Internet. [http://git-scm.com/book/](http://git-scm.com/book/) is one of the dominating influencers.*
