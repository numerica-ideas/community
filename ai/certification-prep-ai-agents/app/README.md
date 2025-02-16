# Certification Exam Preparation Generator

This repository contains a Jupyter notebook that generates certification exam preparation materials using AI agents.

## Overview

The notebook leverages multiple specialized AI agents to create comprehensive study materials:

- **Lead Certification Trainer**: Researches and analyzes certification exam content and requirements
- **Flashcard Author**: Creates detailed flashcards for memorization and quick review
- **Flashcard Editor**: Reviews and refines flashcards for accuracy and clarity 
- **Mock Exam Author**: Develops mock exams with situational questions similar to the real exam
- **Exam Editor**: Reviews and refines mock exams for accuracy and clarity

## Features

- Generation of flashcards with:
  - Clear questions and answers
  - Detailed explanations
  - Relevant resource links
  - Focus on certification-specific content

- Creation of mock exams with:
  - Complex situational questions
  - Multiple choice format
  - Thorough explanations
  - Real exam-style difficulty

- Quality assurance through:
  - Multiple review stages
  - Link validation
  - Content accuracy checks
  - Minimal overlap between materials

## Directory Structure

```
notebooks/
├── config/
│   ├── agents.yaml
│   ├── tasks.yaml
├── certif_prep.ipynb
├── hello_crew.ipynb
├── results/
├── requirements.txt
```

- `config/`: Configuration files for the agents and tasks
    - `agents.yaml`: Configuration of agents (role assigned to each agent, prompts for goals, backstory, etc.)
    - `tasks.yaml`: Configuration of tasks (prompts for descriptions and expected outputs for each task)
- `certif_prep.ipynb`: The Jupyter notebook for the certification prep multi-agent workflow
- `hello_crew.ipynb`: The Jupyter notebook for testing the crew AI framework with a very simple hello world example
- `results/`: Output directory for experiment results
- `requirements.txt`: List of required Python packages

## Requirements

- Python environment with Jupyter Notebook
- Required Python packages (see requirements.txt)
    - crewai
    - crewai-tools
    - python-dotenv
- Access to a language model API (e.g. OpenAI API key). 
***Note**: I tried Llama 3.1:8B and Gemma2:9B running locally on Ollama, but the crew was performing poorly in both cases. The certification crew requires a more powerful LLM. I used the default crewai OpenAI model, which is gpt-4o-mini.*

## Usage

1. Set the crew inputs (certification name, link, number of flashcards and exam questions) in the `certif_prep.ipynb` notebook
2. Run the notebook to generate study materials
3. Find outputs in the `results/` directory
4. [Optional] Customize the agents and tasks in `config/agents.yaml` and `config/tasks.yaml` to generate more accurate and relevant materials for your use case.

## Output Format

The generated materials are saved in Markdown format:

- Flashcards: Individual cards with questions, answers, explanations and resource links
- Mock Exam: Multiple choice questions with detailed explanations and correct answers


## Limitations

- As any LLM-based application, the certification exam preparation generator is not perfect and the output could not be what we expect.
- Links in the flashcards are not always valid (lot of hallucinated links leading to `404 errors`).
- Some exam questions are not always aligned with the certification standard. For example, the material generated for the Google Cloud Professional Machine Learning Engineer certification contains generic questions about Machine Learning and are not focused on Machine Learning on Google Cloud Platform. In addition, the difficulty level is far below the level of the real certification.
- The good answer is most of the time the second option in the multiple choice questions.

This first part is a proof of concept, minimal effort was put into the configuration of the agents and tasks. We will need to improve it to generate more accurate and relevant materials. This will be the aim of the part 2 of this project.
