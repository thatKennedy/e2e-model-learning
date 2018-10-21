# change environment name as desired
ENVNAME = e2e-ml
OUTDIR = ${PWD}/output


env:
	conda env create -n ${ENVNAME} -f environment.yml

update:
	conda env update -n ${ENVNAME} -f environment.yml


# for using jupyter. Make sure you have your environment already activated before running
ipykernel:
	python -m ipykernel install --user --name ${myenv} --display-name "Python (${myenv})"

# currently hanging for an unknown reason
news:
	cd newsvendor && python main.py --save ${OUTDIR}/news/

sched:
	cd power_sched && python main.py --save ${OUTDIR}/schec/

storage:
	cd battery_storage && python main.py --save ${OUTDIR}/storage/