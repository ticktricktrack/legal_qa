# README

### Dependencies

```shell rv rub ruby install 4.0.2
```
 or any other ruby installer, should work with 3.4.x just fine but I haven't tested it

```shell
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails db:fixtures load
bin/rails test:system
```

Run the server with

```shell
bin/dev
```

### other dependencies and uses

- Tailwind v4 for styling
- DaisyUI as an easy prefabbed UI component system based on tailwind

### Goals

- [x] Authentication: used Rails 8's brand new authentication system, which works quite well, but isn't as fully featured out of the box as `devise`. Espectially with only a few hours for the task
- [x] Users and Roles. `User` is the only model, both lawyer and admin are based on a `role` field. With a redirect switch after login in the Authentication concern
- [x] Questions - Answers are represented as a has_one/belongs_to relation. With more time I would prefer to allow multiple answers to the same question
- [x] Lawyers can create an answer to a question
- [x] User can pay for an answer. Until then, the answer is not visible to the user. This is a basic status update, of course a payment and invoice model would be next on the list
- [x] Turbo updates. If a new question is created, it will pop onto the lawyers view immediately. With a bit more time I'd have done the same for answers
- [x] Admin dashboard with a list of all questions, counts and summing up fees paid and fees outstanding
- [x] Formatting - As much was easy with DaisyUI. When I ran into a block I moved on quickly to prioritize larger open tasks
- [x] Basic integration testing. I've added a few browser tests, with more time a bunch of test would be next before the feature scope grows
- [x] Fly.io hosting
- [ ] email notification
