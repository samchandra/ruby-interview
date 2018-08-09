# Omise Code Challenges

This repository houses Omise's interviewing code challenges. These are small hands-on
projects that are very relevant to the tasks you will be working on at Omise.

### Ground Rules

* We prefer well-thought-out solutions over the quick-and-dirty kind. So take your time,
  if you need it. A rushed job is usually matched by a swift rejection.
* Average completion time so far has been around one to two weeks.
* Submission is done via a [git format-patch](https://git-scm.com/docs/git-format-patch). Attach
  your patches in an e-mail and send it to [jobs@omise.co](mailto:jobs@omise.co).

### Challenges

Pick the one that most suites the position you wish to apply.

**Omise**

* Backend / Ruby on Rails - [tamboon-rails](https://github.com/omise/challenges/tree/challenge-rails)
* Backend / Go - [go-challenge](https://github.com/omise/challenges/tree/challenge-go)
* Frontend / React - [tamboon-react](https://github.com/omise/challenges/tree/challenge-react)
* Mobile App / iOS and Android - [tamboon-mobile](https://github.com/omise/challenges/tree/challenge-mobile)
* Design / UX - [design-challenge](https://github.com/omise/challenges/blob/challenge-design/design-challenge.pdf)

**Trading Exchange**

* Backend / Elixir [exchange-challenge](https://gist.github.com/theesit-omise/26abab54487996d9702535421b459858)
* Frontend / React - [tamboon-react](https://github.com/omise/challenges/tree/challenge-react)
* Backend / Go - [go-challenge](https://github.com/omise/challenges/tree/challenge-go)

**OmiseGO**

* Backend / Elixir - [omg-elixir-challenge](https://gist.github.com/T-Dnzt/2b6e8d74167e07783a689ba4fe8ef9ff)
* Frontend / React - [omg-react-challenge](https://gist.github.com/T-Dnzt/71b2fa89ca47c465119bd3d9ed94db29)
* Backend / Go - [go-challenge](https://github.com/omise/challenges/tree/challenge-go)

### Free Style Challenge

If you feel that none of the challenges are sufficient to demonstrate your coding ability,
you can also choose to submit any project of your own choosing that you are most proud of.
=======
![Tam Boon](https://cdn.omise.co/assets/tamboon.jpg)

# Tam Boon

_Tam boon_ (which means "making merit" in Thai) is a simple Ruby on Rails
app that contains bugs and rough code that you need to fix and refactor
in order to be offered an interview at Omise.

Read this document entirely before starting the exercises as you'll learn how
we expect you to write code, our rules for code and how to submit your changes
back to us.

## Setup

This app provides a way for merit makers to donate money to a charity of their
choosing using their credit card.

At the root path you will find a list of charities, a field to enter an amount,
and a series of credit card fields powered by Omise. The amount must be sent in
Thai Baht. But both the Omise API and the `total` column in the charity
table expect an integer value in the smallest unit of the Thai Baht, the
satang.

Note that you must register an Omise account and replace both the `pkey`
and `skey` fields in `config/secrets.yml` to use the app in development
mode.

To run the test simply run `rake test`. You'll notice that two tests already
fail. You'll have to fix or add code (without changing the test) to make
the tests pass.

## Exercises

  1. Fix the race condition in the balance amount column.
  2. Refactor and improve the code in the donate action.
  3. Fix and add integration tests to allow subunits in the amount field.
  4. Add a feature to allow a charity to be picked at random.

Bonus exercise: Remove all `Rails.env.test?` conditionals from the code.

## Principles

We want you to focus on those three principles while writing code:
clarity, simplicity and defensiveness.

* Clarity: write clear code that any developer can read and understand
  in one go.
* Simplicity: write gimmick-free and straightforward code with no ambiguities.
* Defensiveness: cover edge cases and treat user inputs with care.

## Testing

This app comes with a full test suite. The integration tests for the fix and
for the new feature are already written. It's up to you to write unit tests for
the rest of the code you'll write in existing or newly created classes and
modules. Note that we require that all tests must pass before we can invite you
in for an interview.

In test mode no network connection is made to Omise servers. In the
codebase you'll notice that we use conditionals to switch between doing
call to the Omise library in normal use and constructing an OpenStruct
for test.

You may not make network calls during the tests. However, if you can
think of a better way to do the testing than using these conditionals,
you're free to implement this, and your improvement will be taken in
to account in your scoring.

## Rules

You can:

  - re-organize the codebase;
  - create new classes/modules/methods;
  - modify existing code;
  - add tables or columns in the existing database schema.

You can't:

  - change existing behaviors;
  - install more gems than those already in the Gemfile;
  - change the database from PostgreSQL to something else;
  - change any of the urls or parameter names.

## Submitting Your Code

You must email your changes as a git patch to jobs@omise.co. Your patch must
consist of multiple separate commits, per exercise. Your commit
message must communicate clearly what has been done in each commit. Have a look
at previous commits to have a clear idea of what we expect.

If you notice more bugs in the original implementation you can add fixes for
those as well. You won't be penalized if you don't. However we ask you not
to add more features than the one given in the exercise list.

Note that we will outright reject any submission which does not follow the
guidelines outlined in this README.
