#!/opt/miniforge3/envs/localchatbot/bin/python

from langchain.chat_models import ChatOllama
from langchain.callbacks.manager import CallbackManager
from langchain.callbacks.streaming_stdout import StreamingStdOutCallbackHandler
from langchain.chains import ConversationChain
from langchain.memory import ConversationBufferMemory

# Ollama should be up and running on your local system
chat = ChatOllama(
    model="llama3:8b",  # change the model as needed
    streaming=True,
    callback_manager=CallbackManager(
        [StreamingStdOutCallbackHandler()]
    ),
    verbose=False,
    temperature=0.8  # change the value as needed
)

chat_chain = ConversationChain(
    llm=chat,
    memory=ConversationBufferMemory(), # change the memory type as needed
)

quit_signal = ['bye', 'quit', 'exit', 'break']
user_input = ''
while True:
    user_input = input('\nUser: ')
    if user_input.lower() in quit_signal:
        break
    print('\nAI: ', end="")
    ai_response = chat_chain.predict(input=user_input)