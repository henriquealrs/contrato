TEMPLATE=contrato_auto.tex.template
# VENDEDOR=João da Silva, brasileiro, solteiro, engenheiro, CPF xxx
# COMPRADOR=Maria Oliveira, brasileira, solteira, médica, CPF xxx
# VALOR_TOTAL_EXTENSO=cinqüenta mil reais
# VALOR_TOTAL_NUM=50.000,00
# SINAL=14.000,00
# PARCELAS=6
# VALOR_PARCELA=6.000,00
# DATA_PRIMEIRA_PARCELA=10/04/2026
# CIDADE=São Paulo
# DATA_CONTRATO=10 de março de 2026
# MATRICULA=12345
# CARTORIO=1º Ofício de Registro de Imóveis de São Paulo
# DATA_POSSE=10/03/2026
# FORO=São Paulo/SP
TEX=contrato_auto.tex
PDF=contrato_auto.pdf

all: $(PDF)

$(TEX): $(TEMPLATE) dados.env
	. ./dados.env && envsubst < $(TEMPLATE) > $(TEX)

$(PDF): $(TEX)
	pdflatex $(TEX)

clean:
	rm -f *.aux *.log *.out *.pdf contrato.tex
