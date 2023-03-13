# chatgpt

A simple client for the ChatGPT API written in Ruby.

### Setup

To install the dependencies, use `bundle install`. You need to put your [ChatGPT API key](https://platform.openai.com/account/api-keys) in a `.env` file in the root of this repo. The file should look like:

```
CHATGPT_API_KEY="PUT-KEY-HERE"
```

Keep in mind that you start out with free credits that will be drawn down from with every request and that will eventually expire. Make sure you understand the [pricing rules](https://openai.com/pricing) and keep an eye on your [usage](https://platform.openai.com/account/usage).

### Usage

The `chatgpt` file is the entrypoint to the client. You can print the usage help with:

```
./chatgpt
```

The main usage loop is to set up conversations as YAML files in the `conversations/` directory (see example there for format), then send it to ChatGPT to get the next message back. You can review conversations with commands under the `chatgpt convo` subcommand, and you can get the next message for a conversation with `chatgpt chat send CONVO_NAME` (that last command has a `-d` debug flag for printing the entire response back from the API in addition to the generated message).
