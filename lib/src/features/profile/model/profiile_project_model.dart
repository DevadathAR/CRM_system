import 'package:crm_system/src/features/dash_board/presentation/widget/projectDetailCard.dart';
import 'package:crm_system/src/features/profile/presentation/widget/profile_vacation.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:flutter/material.dart';

final List<ProjectCard> mockProjects = [
  const ProjectCard(
    projectId: "PN0001265",
    projectName: "Medical App (iOS native)",
    creationDate: "Created Sep 12, 2020",
    priority: "Medium",
    allTasks: 34,
    activeTasks: 13,
    projectIcon: projectAvatar3, // Replace with your SVG path
  ),
  const ProjectCard(
    projectId: "PN0001266",
    projectName: "Food Delivery Service",
    creationDate: "Created Sep 12, 2020",
    priority: "Low",
    allTasks: 34,
    activeTasks: 13,
    projectIcon: projectavtar1, // Replace with your SVG path
  ),
  const ProjectCard(
    projectId: "PN0001267",
    projectName: "E-commerce Platform",
    creationDate: "Created Nov 15, 2021",
    priority: "Low",
    allTasks: 50,
    activeTasks: 25,
    projectIcon: projectAvatar2, // Replace with your SVG path
  ),
  const ProjectCard(
    projectId: "PN0001265",
    projectName: "Medical App (iOS native)",
    creationDate: "Created Sep 12, 2020",
    priority: "Medium",
    allTasks: 34,
    activeTasks: 13,
    projectIcon:projectAvatar3, // Replace with your SVG path
  ),
  const ProjectCard(
    projectId: "PN0001266",
    projectName: "Food Delivery Service",
    creationDate: "Created Sep 12, 2020",
    priority: "Low",
    allTasks: 34,
    activeTasks: 13,
    projectIcon: projectavtar1, // Replace with your SVG path
  ),
  const ProjectCard(
    projectId: "PN0001267",
    projectName: "E-commerce Platform",
    creationDate: "Created Nov 15, 2021",
    priority: "Low",
    allTasks: 50,
    activeTasks: 25,
    projectIcon: projectavtar1, // Replace with your SVG path
  ),
  const ProjectCard(
    projectId: "PN0001265",
    projectName: "Medical App (iOS native)",
    creationDate: "Created Sep 12, 2020",
    priority: "Medium",
    allTasks: 34,
    activeTasks: 13,
    projectIcon:projectavtar1, // Replace with your SVG path
  ),
  const ProjectCard(
    projectId: "PN0001266",
    projectName: "Food Delivery Service",
    creationDate: "Created Sep 12, 2020",
    priority: "Low",
    allTasks: 34,
    activeTasks: 13,
    projectIcon: projectavtar1, // Replace with your SVG path
  ),
  const ProjectCard(
    projectId: "PN0001267",
    projectName: "E-commerce Platform",
    creationDate: "Created Nov 15, 2021",
    priority: "Low",
    allTasks: 50,
    activeTasks: 25,
    projectIcon: projectavtar1, // Replace with your SVG path
  ),
];

final List<ProfileVacation> mockVacationList = [
  ProfileVacation(
    avatarColor: AppColors.blue,
    leaveType: "Sick Leave",
    status: "Pending",
    statusContainerColor: AppColors.yellow,
    dateRange: "Sep 13, 2020 - Sep 16, 2020",
    duration: "3d",
  ),
  ProfileVacation(
    avatarColor: AppColors.yellow,
    leaveType: "Casual Leave",
    status: "Approved",
    statusContainerColor: AppColors.green,
    dateRange: "Oct 01, 2020 - Oct 03, 2020",
    duration: "2d",
  ),
  ProfileVacation(
    avatarColor: AppColors.yellow,
    leaveType: "Maternity Leave",
    status: "Rejected",
    statusContainerColor: AppColors.blue,
    dateRange: "Nov 15, 2020 - Nov 30, 2020",
    duration: "15d",
  ),
];
