%module CGAL_Interpolation

%include "SWIG_CGAL/common.i"
%import  "SWIG_CGAL/Common/Macros.h"

//include files
%{
  #include  <SWIG_CGAL/Kernel/typedefs.h>
  #include <SWIG_CGAL/Triangulation_2/Delaunay_triangulation_2.h>
  #include <SWIG_CGAL/Triangulation_2/Regular_triangulation_2.h>
  #include <SWIG_CGAL/Triangulation_2/triangulation_handles.h>
  #include <SWIG_CGAL/Triangulation_2/triangulation_iterators.h>  
  #include <SWIG_CGAL/Common/Input_iterator_wrapper.h>
  #include <SWIG_CGAL/Common/Output_iterator_wrapper.h>
  #include <CGAL/natural_neighbor_coordinates_2.h>
  #include <CGAL/regular_neighbor_coordinates_2.h>
%}


%include "SWIG_CGAL/Triangulation_2/config.i"
%import  "SWIG_CGAL/Triangulation_2/CGAL_Triangulation_2.i"
%import "SWIG_CGAL/Kernel/Point_2.h"

%pragma(java) jniclassimports  =%{import CGAL.Triangulation_2.Delaunay_triangulation_2; import CGAL.Triangulation_2.Regular_triangulation_2; import CGAL.Kernel.Point_2; import CGAL.Kernel.Weighted_point_2; import java.util.Collection; import CGAL.Triangulation_2.Delaunay_triangulation_2_Face_handle; import CGAL.Triangulation_2.Delaunay_triangulation_2_Vertex_handle; import CGAL.Triangulation_2.Regular_triangulation_2_Face_handle; import CGAL.Triangulation_2.Regular_triangulation_2_Vertex_handle; import java.util.Iterator; import CGAL.Triangulation_2.Delaunay_triangulation_2_Edge; import CGAL.Triangulation_2.Regular_triangulation_2_Edge;%}
%pragma(java) moduleimports    =%{import CGAL.Triangulation_2.Delaunay_triangulation_2; import CGAL.Triangulation_2.Regular_triangulation_2; import CGAL.Kernel.Point_2; import CGAL.Kernel.Weighted_point_2; import java.util.Collection; import CGAL.Triangulation_2.Delaunay_triangulation_2_Face_handle; import CGAL.Triangulation_2.Delaunay_triangulation_2_Vertex_handle; import CGAL.Triangulation_2.Regular_triangulation_2_Face_handle; import CGAL.Triangulation_2.Regular_triangulation_2_Vertex_handle; import java.util.Iterator; import CGAL.Triangulation_2.Delaunay_triangulation_2_Edge; import CGAL.Triangulation_2.Regular_triangulation_2_Edge;%}

%include "std_pair.i"
%template(Double_and_bool) std::pair<double,bool>;
%typemap(javaimports)  std::pair<Point_2,double> %{import CGAL.Kernel.Point_2;%}
%template(Point_2_and_double) std::pair<Point_2,double>;
%typemap(javaimports)  std::pair<Weighted_point_2,double> %{import CGAL.Kernel.Weighted_point_2;%}
%template(Weighted_point_2_and_double) std::pair<Weighted_point_2,double>;

%{
  #ifndef SWIG
  namespace internal{
    template <class T1,class T2,class T3>
    std::pair<T2,T3> extract_pair(const CGAL::Triple<T1,T2,T3>& triple){return std::make_pair(triple.second,triple.third);}
  }
  #endif  
%}

%include "SWIG_CGAL/Interpolation/declare_natural_neighbor_coordinates_2.i"
%include "SWIG_CGAL/Interpolation/declare_regular_neighbor_coordinates_2.i"


//=============



