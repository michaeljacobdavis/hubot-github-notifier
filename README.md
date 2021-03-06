## Hubot Github Notifier

This hubot plugin announces changes to github repositories of your choosing.

### Setup
- In the repo you want to be notified about go to **Webhooks & services**
- Add a webhook
- The **Payload URL** will be `[address-to-hubot]:[port-of-hubot]/hubot/github-notifier-hook?room=[room-to-notify]`
- Choose the events you care about (if you don't want to be notified about comments, don't check comments).

*NOTE:* If you want to notify multiple rooms, just specify multiple `room` query params `?room=general&room=random`

![](example.gif)

### Currently Supported events

- [`pull_request`](https://developer.github.com/v3/activity/events/types/#pullrequestevent): notifies users when an action is taken on a pull request.
- [`release`](https://developer.github.com/v3/activity/events/types/#releaseevent): notifies users when a new release has been created.
- [`membership`](https://developer.github.com/v3/activity/events/types/#membershipevent): notifies users when a person is added to or removed from an organization.

### X event isn't working!

If an event isn't handled you'll see an error of:
`github notifier error: event type not found: [event-type]`

To handle that type of event, just add a file with the name of the event to the `scripts/events/` directory. Pull requests welcome!
