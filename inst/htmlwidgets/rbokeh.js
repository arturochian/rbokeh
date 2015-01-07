HTMLWidgets.widget({

  name: 'rbokeh',

  type: 'output',

  initialize: function(el, width, height) {
    // var Plot = null;
    // return Plot;
    return {

    }
  },

  renderValue: function(el, x, instance) {

    // hack to deal with bad JSON for type="image"
    for (var i = 0; i < x.spec.length; i++) {
      if(x.spec[i].type == "image" || x.spec[i].type == "image_rgba")
        x.data[i].image = [x.data[i].image];
    }

    if(x.options.r_debug) {
      console.log(x);
      console.log(JSON.stringify(x.data));
      console.log(JSON.stringify(x.spec));
      console.log(JSON.stringify(x.options));
    }

    var Plot = Bokeh.Plotting.make_plot(x.spec, 
      x.data, x.options);

    if(x.options.r_debug) {
      console.log(Plot);
    }

    Bokeh.Plotting.show(Plot, el);

    ///////////////////

    // var modeltype = "Plot";
    // Bokeh.logger.info("Realizing plot:")
    // Bokeh.logger.info(" - modeltype: Plot");
    // Bokeh.logger.info(" - modelid: " + x.modelid);
    // Bokeh.logger.info(" - elementid: " + x.elementid);

    // var dv = document.createElement('div');
    // dv.id = x.elementid;
    // dv.setAttribute("class", "plotdiv");
    // el.appendChild(dv);
    // console.log(x.all_models)
    // Bokeh.load_models(x.all_models);
    // var model = Bokeh.Collections(modeltype).get(x.modelid);
    // var view = new model.default_view({model: model, el: '#' + x.elementid});
    // Bokeh.index[x.modelid] = view;
  },

  resize: function(el, width, height, instance) {

  }

});
