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
