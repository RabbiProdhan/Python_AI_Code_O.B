pip install openai pyttsx3


import openai
import pyttsx3

# Set your OpenAI GPT-3 API key
api_key = "YOUR_OPENAI_API_KEY"
openai.api_key = api_key

# Initialize the text-to-speech engine
engine = pyttsx3.init()

# Function to interact with the GPT-3 model
def chat_with_gpt3(prompt):
    response = openai.Completion.create(
        engine="davinci",  # You can use "davinci" or "gpt-3.5-turbo"
        prompt=prompt,
        max_tokens=100  # Adjust based on your needs
    )
    return response.choices[0].text

# Function to speak the AI's response
def speak(text):
    engine.say(text)
    engine.runAndWait()

# Main loop for voice interaction
speak("Hello, I am O.B, your AI voice assistant. How can I assist you today?")

while True:
    user_input = input("You: ")  # You can use a speech recognition library for voice input

    if user_input.lower() == "exit":
        speak("Goodbye!")
        break

    response = chat_with_gpt3("User: " + user_input)
    speak("O.B: " + response)
