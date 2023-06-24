#!/bin/bash
echo "*****************Creando directorio para repositorios*****************"
mkdir Proyectos
cd Proyectos
mkdir cm_psiconnea
export rama=$(git branch --show-current)
echo "*****************Directorio Proyectos creado correctamente************"
echo "*****************Clonando repositorio Cuadro de Mando*****************"
git clone --quiet -b develop git@github.com:Rosadesarrollo/cm_psiconnea.git ./cm_psiconnea
echo "*****************Clonando repositorio psiconnea_front*****************"
git clone --quiet -b develop git@github.com:Rosadesarrollo/psiconnea-front.git ./psiconnea-front
echo "*****************Clonando repositorio psiconnea_emergencias***********"
git clone --quiet -b develop git@github.com:Rosadesarrollo/psiconnea-emergencias.git ./psiconnea-emergencias
echo "*****************Clonando repositorio psiconnea_admin*****************"
git clone --quiet -b develop git@github.com:Rosadesarrollo/psiconnea-admin.git ./psiconnea-admin
echo "*****************Clonando repositorio psiconnea_api*****************"
git clone --quiet -b develop git@github.com:Rosadesarrollo/psiconnea-api.git ./psiconnea-api
echo "*****************Clonando repositorio app.psiconnea_traducciones******"
git clone --quiet -b develop git@github.com:Rosadesarrollo/traducciones_app.git ./traducciones_app
echo "*****************Fin del Script***************************************"
