// Top-level build file where you can add configuration options common to all sub-projects/modules.

configurations.all {
    resolutionStrategy {
        force("com.google.guava:guava:28.0-android")
        force("com.google.code.findbugs:jsr305:3.0.2")
        force("com.google.code.findbugs:jsr305-annotations:3.0.2")
        force("com.google.code.findbugs:jsr305-api:3.0.2")
        force("com.google.code.findbugs:jsr305-impl:3.0.2")
        force("com.google.code.findbugs:jsr305-impl-annotations:3.0.2")
    }
}

subprojects {
    project.file("${rootProject.file("../build")}/${project.name}")

    //project.evaluationDependsOn(":app")
    dependencyLocking {
        ignoredDependencies.add("io.flutter.embedding:*")
        lockFile = file("${rootProject.projectDir}/project-${project.name}.lockfile")
        if (!project.hasProperty("local-engine-repo")) {
            lockAllConfigurations()
        }
    }

}

tasks.register("clean")

tasks.withType<JavaCompile>().configureEach {
    options.compilerArgs = listOf("-Xdoclint:none", "-Xlint:none", "-nowarn")
}
