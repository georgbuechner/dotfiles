import deepl
import click

AUTH_KEY = "69b69717-9d68-47c6-9113-bbfc5a088706:fx"

@click.command()
@click.argument("inp")
@click.option('--tlang', default="DE", help='target language')
def run(inp, tlang):
    if len(inp) == 0: 
        print("empty input")
    else: 
        # modify string 
        inp = inp.replace('-\n', ' ').replace('\n', '').replace('\r', '')

        # translate text
        translator = deepl.Translator(AUTH_KEY) 
        result = translator.translate_text(inp, target_lang=tlang)
        print(result.text)

if __name__ == '__main__':
    run()
