# Kratos: The Powerful CLI for AI Prompting

Kratos is a command-line interface that simplifies interaction with Anthropic and OpenAI models, enabling quick generation of text, images, and more.

## Installation

To install Kratos, run the following command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/AlexJuca/kratos.sh/main/install/install.sh | bash
```

This command downloads and executes the Kratos installation script from the official Kratos GitHub repository.

## Get Started

### Learn More

Visit the [Kratos GitHub repository](https://github.com/AlexJuca/kratos.sh) for detailed information and documentation.

### Get Started with Kratos

#### Initialize Kratos and Configure Default AI Provider

```bash
kratos init
```

This command initializes Kratos and configures the default AI provider.

#### Perform a Prompt via Anthropic AI or OpenAI

```bash
kratos ask -m "Compress file called kratos into kratos.0.1.0.tar.gz"
```

**Result:**

Performing inference via openai

```
>  tar -czvf kratos.0.1.0.tar.gz kratos
```

This command performs a prompt via Anthropic AI or OpenAI, generating the specified task output.

#### List Available Providers

```bash
kratos providers
```

**Result:**

Kratos currently supports the following providers:

```
> anthropic
> openai - current provider
```

This command lists the available providers in Kratos. You can use `kratos use <provider>` to switch to a different provider.
```