# change environment name and output directory as desired
ENVNAME = e2e-ml
OUTDIR = ${PWD}/output


env:
	conda env create -n ${ENVNAME} -f environment.yml

# update environment if yaml file changes
update:
	conda env update -n ${ENVNAME} -f environment.yml

# currently hanging for an unknown reason
news:
	cd newsvendor && python main.py --save ${OUTDIR}/news/

# run power scheduler
sched:
	cd power_sched && python main.py --save ${OUTDIR}/sched/

# run battery storage learner
storage:
	cd battery_storage && python main.py --save ${OUTDIR}/storage/


# for using jupyter. Make sure you have your environment already activated before running
ipykernel:
	python -m ipykernel install --user --name ${myenv} --display-name "Python (${myenv})"