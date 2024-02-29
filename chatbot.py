import streamlit as st
import ollama
import time


def stream_data(text,delay:float=0.02):
    for word in text.split():
        yield word + " "
        time.sleep(delay)



prompt = st.chat_input("Ask your question.....")


if prompt:
    with st.chat_message("user"):
        st.write(prompt)

    # processing
    with st.spinner("Loading model..."):
        result = ollama.chat(
            model="llama2",
            messages=[
                {
                    "role" : "user",
                    "content" : prompt
                }
            ]
        )
        response = result["messages"]["content"]
        st.write_stream(stream_data(response))