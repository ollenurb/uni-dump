<template>
  <div class="control panel">
    <b-container>
      <b-row class="mt-3" align-h="center">
        <b-col cols="md-9 sm" align-self="center">
          <b-jumbotron
            text-variant="white"
            bg-variant="dark"
            class="text-left mb-3 shadow-sm"
            header="Control Panel"
            lead="Here you can add new teacher, courses and teacher-courses associations."
            header-level="4"
          >
          </b-jumbotron>

          <hr />

          <b-row>
            <b-col lg class="pr-lg-1">
              <!-- New teacher card -->
              <b-card
                class="text-left shadow-sm mb-2"
                title="Insert a new Teacher"
              >
                <b-form>
                  <b-form-group
                    id="input-group-1"
                    label="Name:"
                    label-for="input-1"
                  >
                    <b-form-input
                      id="input-1"
                      v-model="insert_teacher.teacher.name"
                      required
                    ></b-form-input>
                  </b-form-group>

                  <b-form-group
                    id="input-group-2"
                    label="Surname:"
                    label-for="input-2"
                  >
                    <b-form-input
                      id="input-2"
                      v-model="insert_teacher.teacher.surname"
                      required
                    ></b-form-input>
                  </b-form-group>

                  <b-button
                    @click="insertTeacher()"
                    variant="primary"
                    class="mr-2"
                    >Submit</b-button
                  >
                </b-form>
              </b-card>
            </b-col>

            <b-col lg class="pb-2 pl-lg-1">
              <!-- Delete teacher card -->
              <b-card
                class="text-left shadow-sm h-100"
                title="Delete a Teacher"
              >
                <b-form>
                  <b-form-group
                    id="input-group-4"
                    label="Teacher:"
                    label-for="input-4"
                  >
                    <b-form-select
                      id="input-4"
                      :options="state.teachers"
                      v-model="delete_teacher.selected_teacher"
                      required
                    >
                    </b-form-select>
                  </b-form-group>

                  <b-button
                    @click="deleteTeacher()"
                    variant="primary"
                    class="mr-2"
                    >Submit</b-button
                  >
                </b-form>
              </b-card>
            </b-col>
          </b-row>

          <b-row>
            <b-col lg class="pr-lg-1">
              <!-- New course card -->
              <b-card
                class="text-left shadow-sm mb-2"
                title="Insert a new Course"
              >
                <b-form>
                  <b-form-group
                    id="input-group-1"
                    label="Title:"
                    label-for="input-1"
                  >
                    <b-form-input
                      id="input-1"
                      v-model="insert_course.course.title"
                      required
                    ></b-form-input>
                  </b-form-group>
                  <b-button
                    @click="insertCourse()"
                    variant="primary"
                    class="mr-2"
                    >Submit</b-button
                  >
                </b-form>
              </b-card>
            </b-col>

            <b-col lg class="pb-2 pl-lg-1">
              <!-- Delete course card -->
              <b-card class="text-left shadow-sm h-100" title="Delete a Course">
                <b-form>
                  <b-form-group
                    id="input-group-4"
                    label="Course:"
                    label-for="input-4"
                  >
                    <b-form-select
                      id="input-4"
                      :options="state.courses"
                      v-model="delete_course.selected_course"
                      required
                    >
                    </b-form-select>
                  </b-form-group>
                  <b-button
                    @click="deleteCourse()"
                    variant="primary"
                    class="mr-2"
                    >Submit</b-button
                  >
                </b-form>
              </b-card>
            </b-col>
          </b-row>

          <b-row>
            <b-col lg class="pb-2 pr-lg-1">
              <!-- New teacher-course card-->
              <b-card
                class="text-left shadow-sm"
                title="Insert a new Teacher-Course association"
              >
                <b-form>
                  <b-form-group
                    id="input-group-3"
                    label="Teacher:"
                    label-for="input-3"
                  >
                    <b-form-select
                      id="input-3"
                      :options="state.teachers"
                      v-model="insert_teacher_course.teacher_course.teacher.id"
                      required
                    ></b-form-select>
                  </b-form-group>

                  <b-form-group
                    id="input-group-4"
                    label="Course:"
                    label-for="input-4"
                  >
                    <b-form-select
                      id="input-4"
                      :options="state.courses"
                      v-model="insert_teacher_course.teacher_course.course.id"
                      required
                    ></b-form-select>
                  </b-form-group>
                  <b-button
                    @click="insertTeacherCourse()"
                    variant="primary"
                    class="mr-2"
                    >Submit</b-button
                  >
                </b-form>
              </b-card>
            </b-col>

            <b-col lg class="pb-2 pl-lg-1">
              <!-- Delete teacher-course card -->
              <b-card
                class="text-left shadow-sm h-100"
                title="Delete a Teacher-Course association"
              >
                <b-form>
                  <b-form-group
                    id="input-group-3"
                    label="Teacher-Course:"
                    label-for="input-3"
                  >
                    <b-form-select
                      id="input-3"
                      :options="state.teacher_courses"
                      v-model="delete_teacher_course.selected_teacher_course"
                      required
                    ></b-form-select>
                  </b-form-group>
                  <b-button
                    @click="deleteTeacherCourse()"
                    variant="primary"
                    class="mr-2 align-bottom"
                    >Submit</b-button
                  >
                </b-form>
              </b-card>
            </b-col>
          </b-row>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
export default {
  name: "Control panel",
  data() {
    return {
      state: {
        teachers: [{ text: "Select One...", value: -1 }],
        courses: [{ text: "Select One...", value: -1 }],
        teacher_courses: [{ text: "Select One...", value: -1 }],
        error: null,
        pending: true
      },
      insert_teacher: {
        teacher: {
          name: "",
          surname: ""
        }
      },
      insert_course: {
        course: {
          title: ""
        }
      },
      insert_teacher_course: {
        teacher_course: {
          teacher: {
            id: -1
          },
          course: {
            id: -1
          }
        }
      },
      delete_teacher: {
        selected_teacher: -1
      },
      delete_course: {
        selected_course: -1
      },
      delete_teacher_course: {
        selected_teacher_course: -1
      }
    };
  },
  created() {
    this.refresh();
  },
  methods: {
    // Get teachers list
    async getTeachers() {
      this.$http
        .get(process.env.VUE_APP_DEV_API_ENDPOINT + "/TeacherService", {
          responseType: "json", withCredentials: true
        })
        .then(response => {
          this.state.teachers = [{ text: "Select One...", value: -1 }].concat(
            response.data.data.map(x => ({
              value: x.id,
              text: x.name + " " + x.surname
            }))
          );
        })
        .catch(error => {
          if (error.response !== undefined) {
            this.state.error = error.response.data.message;
          } else {
            this.state.error = error.message;
          }
        })
        .finally(() => {
          this.state.pending = false;
        });
    },
    // Get courses list
    async getCourses() {
      this.$http
        .get(process.env.VUE_APP_DEV_API_ENDPOINT + "/CourseService", {
          responseType: "json", withCredentials: true
        })
        .then(response => {
          this.state.courses = [{ text: "Select One...", value: -1 }].concat(
            response.data.data.map(x => ({ value: x.id, text: x.title }))
          );
        })
        .catch(error => {
          if (error.response !== undefined) {
            this.state.error = error.response.data.message;
          } else {
            this.state.error = error.message;
          }
        })
        .finally(() => {
          this.state.pending = false;
        });
    },
    // Get teacher courses list
    async getTeacherCourses() {
      this.$http
        .get(process.env.VUE_APP_DEV_API_ENDPOINT + "/TeacherCourseService", {
          responseType: "json", withCredentials: true
        })
        .then(response => {
          this.state.teacher_courses = [
            { text: "Select One...", value: -1 }
          ].concat(
            response.data.data.map(x => ({
              value: x,
              text:
                x.course.title +
                " - " +
                x.teacher.name +
                " " +
                x.teacher.surname
            }))
          );
        })
        .catch(error => {
          if (error.response !== undefined) {
            this.state.error = error.response.data.message;
          } else {
            this.state.error = error.message;
          }
        })
        .finally(() => {
          this.state.pending = false;
        });
    },

    insertTeacher() {
      if(this.insert_teacher.teacher.name.trim() && this.insert_teacher.teacher.surname.trim()) {
        this.sendPost("TeacherService", {
          teacher: JSON.stringify(this.insert_teacher.teacher)
        });
        this.insert_teacher.teacher.name = "";
        this.insert_teacher.teacher.surname = "";
      } else {
        this.makeToast("danger", "Error", "The input must not be null or empty");
      }
    },

    insertCourse() {
      if(this.insert_course.course.title.trim()) {
        this.sendPost("CourseService", {
          course: JSON.stringify(this.insert_course.course)
        });
        this.insert_course.course.title = "";
      } else {
        this.makeToast("danger", "Error", "The input must not be null or empty");
      }
    },

    insertTeacherCourse() {
      if(this.insert_teacher_course.teacher_course.teacher.id != -1 && this.insert_teacher_course.teacher_course.course.id != -1) {
        this.sendPost("TeacherCourseService", {
          teacherCourse: JSON.stringify(this.insert_teacher_course.teacher_course)
        });
        this.insert_teacher_course.teacher_course.teacher.id = -1;
        this.insert_teacher_course.teacher_course.course.id = -1;
      } else {
        this.makeToast("danger", "Error", "You need to select a valid teacher_course association!");
      }
    },

    deleteTeacherCourse() {
      if(this.delete_teacher_course.selected_teacher_course != -1) {
        this.sendDelete("TeacherCourseService", { teacherId: this.delete_teacher_course.selected_teacher_course.teacher.id, courseId: this.delete_teacher_course.selected_teacher_course.course.id });
        this.delete_teacher_course.selected_teacher_course = -1;
      } else {
        this.makeToast("danger", "Error", "You need to select a valid teacher_course association!");
      }
    },

    deleteTeacher() {
      if(this.delete_teacher.selected_teacher != -1) {
        this.sendDelete("TeacherService", {
          teacherId: this.delete_teacher.selected_teacher
        });
        this.delete_teacher.selected_teacher = -1;
      } else {
        this.makeToast("danger", "Error", "You need to select a valid teacher!");
      }
    },

    deleteCourse() {
      if(this.delete_course.selected_course != -1) {
      this.sendDelete("CourseService", {
        courseId: this.delete_course.selected_course
      });
      this.delete_course.selected_course = -1;
      } else {
        this.makeToast("danger", "Error", "You need to select a valid course!");
      }
    },

    async sendPost(endpoint, paramData) {
      const qs = require("querystring");

      this.$http
        .post(
          process.env.VUE_APP_DEV_API_ENDPOINT + "/" + endpoint,
          qs.stringify(paramData),
          { responseType: "json", withCredentials: true }
        )
        .then(response => {
          this.makeToast("success", "Success", response.data.message);
          this.refresh();
        })
        .catch(error => {
          if (error.response !== undefined) {
            this.makeToast("danger", "Error", error.response.data.message);
          } else {
            this.makeToast("danger", "Error", error.message); 
          }
        })
        .finally(() => {
          this.state.pending = false;
        });
    },

    async sendDelete(endpoint, paramData) {
      this.$http
        .delete(
          process.env.VUE_APP_DEV_API_ENDPOINT + "/" + endpoint,
          { responseType: "json", withCredentials: true, params: paramData  }
        )
        .then(response => {
          this.makeToast("success", "Success", response.data.message);
          this.refresh();
        })
        .catch(error => {
          if (error.response !== undefined) {
            this.makeToast("danger", "Error", error.response.data.message);
          } else {
            this.makeToast("danger", "Error", error.message); 
          }
        })
        .finally(() => {
          this.state.pending = false;
        });
    },

    makeToast(variant = null, title, message) {
      this.$bvToast.toast(message, {
        title: title,
        variant: variant,
        solid: true
      });
    },
    
    // Refresh UI
    refresh() {
      this.getTeachers();
      this.getCourses();
      this.getTeacherCourses();
    }
  }
};
</script>
