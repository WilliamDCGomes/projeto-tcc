import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/discipline_screen_widget.dart';
import '../widgets/discipline_card_widget.dart';

class GradesFaultsController extends GetxController {
  late List<DisciplineScreenWidget> cardAcademicRecordList;
  late CarouselController academicRecordCarouselController;
  late TextEditingController searchDisciplineController;

  GradesFaultsController(){
    _inicializeVariables();
    _loadList();
  }

  _inicializeVariables(){
    searchDisciplineController = TextEditingController();
    academicRecordCarouselController = CarouselController();
  }

  _loadList(){
    cardAcademicRecordList = [
      DisciplineScreenWidget(
        yearValueText: "2019",
        semesterValueText: "1º Semestre",
        gradesFaultsController: this,
        disciplineCardList: _getDisciplinesSemesterList(),
      ),
      DisciplineScreenWidget(
        yearValueText: "2019",
        semesterValueText: "2º Semestre",
        gradesFaultsController: this,
        disciplineCardList: _getDisciplinesSemesterList(),
      ),
      DisciplineScreenWidget(
        yearValueText: "2020",
        semesterValueText: "3º Semestre",
        gradesFaultsController: this,
        disciplineCardList: _getDisciplinesSemesterList(),
      ),
      DisciplineScreenWidget(
        yearValueText: "2020",
        semesterValueText: "4º Semestre",
        gradesFaultsController: this,
        disciplineCardList: _getDisciplinesSemesterList(),
      ),
      DisciplineScreenWidget(
        yearValueText: "2021",
        semesterValueText: "5º Semestre",
        gradesFaultsController: this,
        disciplineCardList: _getDisciplinesSemesterList(),
      ),
      DisciplineScreenWidget(
        yearValueText: "2021",
        semesterValueText: "6º Semestre",
        gradesFaultsController: this,
        disciplineCardList: _getDisciplinesSemesterList(),
      ),
      DisciplineScreenWidget(
        yearValueText: "2022",
        semesterValueText: "7º Semestre",
        gradesFaultsController: this,
        disciplineCardList: _getDisciplinesSemesterList(),
      ),
      DisciplineScreenWidget(
        yearValueText: "2022",
        semesterValueText: "8º Semestre",
        gradesFaultsController: this,
        disciplineCardList: _getDisciplinesSemesterList(),
      ),
    ];
  }

  List<DisciplineCardWidget> _getDisciplinesSemesterList(){
    return [
      DisciplineCardWidget(
        disciplineCode: "0215",
        disciplineName: "Projeto I",
        disciplineWorkload: "40",
        firstCardInformation: "8 faltas | 88,9% Frequência",
        professorDiscipline: "Torres",
      ),
      DisciplineCardWidget(
        disciplineCode: "0225",
        disciplineName: "Ciência de Dados",
        disciplineWorkload: "56",
        firstCardInformation: "2 faltas | 93,9% Frequência",
        professorDiscipline: "André Farina",
        firstNote: 5.8,
        secondNote: 9.4,
        approved: false,
      ),
      DisciplineCardWidget(
        disciplineCode: "0456",
        disciplineName: "Qualidade e Testes de Software",
        disciplineWorkload: "40",
        firstCardInformation: "0 faltas | 100% Frequência",
        professorDiscipline: "Ivan",
        firstNote: 7.5,
        secondNote: 6.59,
        approved: true,
      ),
      DisciplineCardWidget(
        disciplineCode: "0174",
        disciplineName: "Modelagem Computacional em Grafos",
        disciplineWorkload: "56",
        firstCardInformation: "5 faltas | 83,4% Frequência",
        professorDiscipline: "Leandro",
        firstNote: 7.96,
        secondNote: 4.96,
        approved: false,
      ),
      DisciplineCardWidget(
        disciplineCode: "0189",
        disciplineName: "Segurança em Sistemas de Informação",
        disciplineWorkload: "40",
        firstCardInformation: "2 faltas | 96,9% Frequência",
        professorDiscipline: "Marco",
        firstNote: 9.85,
        secondNote: 7.52,
        approved: true,
      ),
      DisciplineCardWidget(
        disciplineCode: "0172",
        disciplineName: "Tópicos em Computação",
        disciplineWorkload: "54",
        firstCardInformation: "6 faltas | 92,9% Frequência",
        professorDiscipline: "Torres",
        firstNote: 7.50,
        secondNote: 6.95,
        approved: true,
      ),
    ];
  }

  previousAcademicRecordCard() async {
    await Future.delayed(Duration(milliseconds: 100));
    academicRecordCarouselController.previousPage();
  }

  nextAcademicRecordCard() async {
    await Future.delayed(Duration(milliseconds: 100));
    academicRecordCarouselController.nextPage();
  }
}