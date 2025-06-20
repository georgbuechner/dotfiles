import deepl
import click

AUTH_KEY = "d7da4515-f623-4804-bd11-d81d45afacb4:fx"

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
