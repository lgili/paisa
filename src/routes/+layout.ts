export const prerender = false;
export const ssr = false;

import type { LayoutLoad } from "./$types";

import "../app.scss";
import "tippy.js/dist/tippy.css";
import "tippy.js/themes/light.css";
import "clusterize.js/clusterize.css";

import dayjs from "dayjs";
import customParseFormat from "dayjs/plugin/customParseFormat";
dayjs.extend(customParseFormat);
import isSameOrBefore from "dayjs/plugin/isSameOrBefore";
dayjs.extend(isSameOrBefore);

import Handlebars from "handlebars";
import helpers from "$lib/template_helpers";
import * as toast from "bulma-toast";
import _ from "lodash";
import { ajax } from "$lib/utils";

import "@formatjs/intl-numberformat/polyfill";
import "@formatjs/intl-numberformat/locale-data/en";

Handlebars.registerHelper(
  _.mapValues(helpers, (helper, name) => {
    return function (...args: any[]) {
      try {
        return helper.apply(this, args);
      } catch (e) {
        console.log("Error in helper", name, args, e);
      }
    };
  })
);

toast.setDefaults({
  position: "bottom-right",
  dismissible: true,
  pauseOnHover: true
});

export const load = (async () => {
  globalThis.USER_CONFIG = await ajax("/api/config");
  return {};
}) satisfies LayoutLoad;
