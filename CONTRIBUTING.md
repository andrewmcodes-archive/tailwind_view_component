# Contributing

[fork]: https://github.com/andrewmcodes/tailwind_view_component/fork
[pr]: https://github.com/andrewmcodes/tailwind_view_component/compare
[style]: https://github.com/styleguide/ruby
[code-of-conduct]: CODE_OF_CONDUCT.md

Hi there! We're thrilled that you'd like to contribute to this project. Your help is essential for keeping it great.

If you have any substantial changes that you would like to make, please [open an issue](http://github.com/andrewmcodes/tailwind_view_component/issues/new) first to discuss them with us.

Contributions to this project are [released](https://help.github.com/articles/github-terms-of-service/#6-contributions-under-repository-license) to the public under the [project's open source license](LICENSE.txt).

Please note that this project is released with a [Contributor Code of Conduct][code-of-conduct]. By participating in this project you agree to abide by its terms.

## Submitting a pull request

0. [Fork][fork] and clone the repository
1. Configure and install the dependencies: `bundle`
2. Make sure the tests pass on your machine: `bundle exec rake`
3. Create a new branch: `git checkout -b my-branch-name`
4. Make your change, add tests, and make sure the tests still pass
5. Add an entry to the top of `CHANGELOG.md` for your changes
6. Push to your fork and [submit a pull request][pr]
7. Pat yourself on the back and wait for your pull request to be reviewed and merged.

Here are a few things you can do that will increase the likelihood of your pull request being accepted:

- Write tests.
- Keep your change as focused as possible. If there are multiple changes you would like to make that are not dependent upon each other, consider submitting them as separate pull requests.
- Write a [good commit message](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html).

## Releasing

If you are the current maintainer of this gem:

1. Create a branch for the release: `git checkout -b release-vxx.xx.xx`
1. Bump gem version in `lib/tailwind/view_components/version.rb`. Try to adhere to [SemVer](https://semver.org).
1. Add version heading/entries to `CHANGELOG.md`.
1. Make a PR to tailwind/view_components.
1. Merge tailwind/view_components PR
1. Get latest changes from default branch: `git pull origin main`
1. Build a local gem: `gem build tailwind_view_component.gemspec`
1. Tag and push: `git tag vx.xx.xx; git push --tags`
1. Create a GitHub [release](https://github.com/andrewmcodes/tailwind_view_component/releases/new) with the pushed tag and populate it with a list of the changes from `CHANGELOG.md`.
1. Push to rubygems.org -- `gem push tailwind_view_component-VERSION.gem`
